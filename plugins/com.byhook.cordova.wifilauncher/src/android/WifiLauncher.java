/*
       Licensed to the Apache Software Foundation (ASF) under one
       or more contributor license agreements.  See the NOTICE file
       distributed with this work for additional information
       regarding copyright ownership.  The ASF licenses this file
       to you under the Apache License, Version 2.0 (the
       "License"); you may not use this file except in compliance
       with the License.  You may obtain a copy of the License at

         http://www.apache.org/licenses/LICENSE-2.0

       Unless required by applicable law or agreed to in writing,
       software distributed under the License is distributed on an
       "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
       KIND, either express or implied.  See the License for the
       specific language governing permissions and limitations
       under the License.
*/
package com.byhook.cordova.wifilauncher;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.PluginResult;
import org.json.JSONArray;
import org.json.JSONException;

import android.app.Activity;
import android.content.Intent;


public class WifiLauncher extends CordovaPlugin {

    public static String TAG = "WifiLauncher";
	
	
    /**
     * Executes the request and returns PluginResult.
     * @param action                 The action to execute.
     * @param args                         JSONArry of arguments for the plugin.
     * @param callbackContext                The callback context used when calling back into JavaScript.
     * @return                                 A PluginResult object with a status and message.
     */
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
		
		PluginResult.Status status = PluginResult.Status.OK;
        String result = "";

        if (action.equals("wifi")) {
			((Activity)cordova).startActivity(new Intent(android.provider.Settings.ACTION_WIFI_SETTINGS));
		}

        callbackContext.sendPluginResult(new PluginResult(status, result));
        return true;
	}
	
}