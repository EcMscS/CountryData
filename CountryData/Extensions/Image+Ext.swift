//
//  Image+Ext.swift
//  CountryData
//
//  Created by Jeffrey Lai on 8/23/20.
//  Copyright © 2020 Jeffrey Lai. All rights reserved.
//

import UIKit
import SwiftDraw

extension Image {

  // UIImage backed with PDF preserves vector data.
  func pdfImage() -> UIImage? {
    guard
      let data = pdfData(),
      let provider = CGDataProvider(data: data as CFData),
      let pdf = CGPDFDocument(provider),
      let page = pdf.page(at: 1) else {
        return nil
    }

    return UIImage
      .perform(NSSelectorFromString("_imageWithCGPDFPage:"), with: page)?
      .takeUnretainedValue() as? UIImage
  }
}
