/*
 * Copyright (C) 2010 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.android.internal.telephony;

import android.os.SystemProperties;
//cm10 f160
import android.util.Log;

public class SimRegionCache {
//cm10 f160
    private static final String LOG_TAG = "GSM";
    private static final String PROPERTY_CACHED_MCC = "gsm.cachedMcc";


    public static final int MCC_UNSET  = Integer.MIN_VALUE;
    public static final int MCC_KOREAN = 450;

    private static int regionFromMcc = MCC_UNSET;

//cm10 f160
    /**
     * Updates the cache of the SIM card region code manually with the
     * specified MCC (Mobile Country Code).  Specify null if you want
     * to get the ICC operator numeric from SystemProperties.
     */
    public static void setRegion(String mcc) {
        if (mcc == null) {
            if (regionFromMcc != MCC_UNSET) {
                return;
            }
            mcc = SystemProperties.get(PROPERTY_CACHED_MCC, null);
            if (mcc == null) {
                mcc = SystemProperties.get(TelephonyProperties.PROPERTY_ICC_OPERATOR_NUMERIC, null);
           }
        }
        if (mcc == null || mcc.length() < 3) {
            regionFromMcc = MCC_UNSET;
            return;
        }

        mcc = mcc.substring(0, 3);

        try {
            regionFromMcc = Integer.parseInt(mcc);
        } catch (Exception e) {
            Log.w(LOG_TAG, "Invalid MCC: " + mcc, e);
            return;
        }

        // Store the cached MCC in the system properties to avoid class loader issues.
        SystemProperties.set(PROPERTY_CACHED_MCC, mcc);

        if (regionFromMcc == MCC_KOREAN) {
            Log.w(LOG_TAG, "Korean SIM detected - alternative message encoding might be applied on the received SMS and MMS messages.");
        } else {
            Log.d(LOG_TAG, "Detected MCC: " + regionFromMcc);
        }
    }
//cm10 f160 end

    /**
     * Returns the region as read from the MCC of the SIM card.
     * If the property {@link TelephonyProperties#
     * PROPERTY_ICC_OPERATOR_NUMERIC}
     * returns null or an empty String, the value is {@link #MCC_UNSET}
     *
     * @return the cached region, if set.
     */
    public static int getRegion() {
        if (regionFromMcc == MCC_UNSET) {
//cm10 f160
/*            String plmn = SystemProperties.get(
                    TelephonyProperties.PROPERTY_ICC_OPERATOR_NUMERIC,
                    null);

            if (plmn != null && plmn.length() >= 3) {
                try {
                    regionFromMcc = Integer.parseInt(plmn.substring(0, 3));
                } catch(Exception e) {
                    // Nothing that can be done here.
                }
            }*/
	    setRegion(null);

        }
        return regionFromMcc;
    }
}
