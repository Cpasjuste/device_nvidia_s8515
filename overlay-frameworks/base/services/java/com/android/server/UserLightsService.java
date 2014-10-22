/* UserLightsService @ Cpasjuste */

package com.android.server;

import android.content.Context;
import android.os.Handler;
import android.os.IUserLightsService;
import android.os.Looper;
import android.os.Message;
import android.os.Process;
import android.util.Log;

public class UserLightsService extends IUserLightsService.Stub {

	private static final String TAG = "UserLightsService";
	private Context mContext;
	private LightsService mLightsService;

	public UserLightsService(Context context, LightsService lights) {
		super();
		mContext = context;
		mLightsService = lights;
	}

	public void setButtonBrightness(int brightness) {
		if( mLightsService != null ) {
			LightsService.Light buttonLight = mLightsService.getLight(2);
			if( buttonLight != null ) {
				buttonLight.setBrightness(brightness);
			}
		}
	}
}

