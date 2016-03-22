//
//  Log.swift
//  Symagic
//
//  Created by Wim Haanstra on 20/01/15.
//  Copyright (c) 2015 Symagic. All rights reserved.
//

import UIKit

class Log: NSObject {
	
	static var logLevel: Int = 0;
	
	class func debug(message: String, function: String = #function, filePath: String = #file, fileLine: Int = #line) {
		if (Log.logLevel == 0) {
			Log.output("DEBUG", function: function, fileName: filePath, fileLine: fileLine, message: message);
		}
	}
	
	class func info(message: String, function: String = #function, filePath: String = #file, fileLine: Int = #line) {
		if (Log.logLevel <= 1) {
			Log.output("INFO", function: function, fileName: filePath, fileLine: fileLine, message: message);
		}
	}
	
	class func error(message: String, function: String = #function, filePath: String = #file, fileLine: Int = #line) {
		if (Log.logLevel <= 2) {
			Log.output("ERROR", function: function, fileName: filePath, fileLine: fileLine, message: message);
		}
	}
	
	class func warning(message: String, function: String = #function, filePath: String = #file, fileLine: Int = #line) {
		if (Log.logLevel <= 3) {
			Log.output("WARNING", function: function, fileName: filePath, fileLine: fileLine, message: message);
		}
	}
	
	class func output(logLevel: String, function: String, fileName: String, fileLine: Int, message: String) {
		
		var file = NSURL(fileURLWithPath: fileName).lastPathComponent;
		
		if (file == nil) {
			file = "UNKNOWN";
		}
		
		let date = NSDate().toString("HH:mm:ss")
		
		print("\(date) [\(logLevel)] [\(file!):\(fileLine) \(function)] \(message)");
		
	}
	
}

extension NSDate {
	func toString(format: String) -> String {
		let dateFormatter = NSDateFormatter();
		dateFormatter.dateFormat = format;
//		dateFormatter.locale = self.languageLocale();
		return dateFormatter.stringFromDate(self);
	}
}
