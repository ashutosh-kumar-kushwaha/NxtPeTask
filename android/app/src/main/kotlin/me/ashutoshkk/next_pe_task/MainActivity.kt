package me.ashutoshkk.next_pe_task

import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel


class MainActivity: FlutterActivity(){

    private val CHANNEL = "native_bridge"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine){
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call: MethodCall, result: MethodChannel.Result ->
                if (call.method == "buyProduct") {
                    buyProduct()
                    result.success(null)
                } else {
                    result.notImplemented()
                }
            }
    }

    private fun buyProduct(){
        Toast.makeText(this, "Buy", Toast.LENGTH_LONG).show()
    }

}
