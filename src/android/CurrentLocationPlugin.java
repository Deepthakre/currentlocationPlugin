package com.example.currentlocation;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;
import org.json.JSONArray;
import org.json.JSONException;
import android.location.Location;
import android.location.LocationManager;
import android.content.Context;

public class CurrentLocationPlugin extends CordovaPlugin {
    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if (action.equals("getCurrentLocation")) {
            this.getCurrentLocation(callbackContext);
            return true;
        }
        return false;
    }

    private void getCurrentLocation(CallbackContext callbackContext) {
        LocationManager locationManager = (LocationManager) cordova.getActivity().getSystemService(Context.LOCATION_SERVICE);
        Location location = locationManager.getLastKnownLocation(LocationManager.GPS_PROVIDER);
        if (location != null) {
            callbackContext.success(location.getLatitude() + "," + location.getLongitude());
        } else {
            callbackContext.error("Location not available");
        }
    }
}
