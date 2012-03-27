package com.phonegap.sleepyhead;

import android.os.Bundle;
import com.phonegap.*;

public class App extends DroidGap {
    /** Called when the activity is first created. */
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //super.loadUrl("file:///android_asset/www/self_report.html");
        super.loadUrl("file:///android_asset/www/exp.html");
    }
}