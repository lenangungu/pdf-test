//
//  ViewController.swift
//  pdf test
//
//  Created by Lena Ngungu on 12/19/17.
//  Copyright © 2017 Lena Ngungu. All rights reserved.
//

import UIKit
import GDPDFView

class ViewController: UIViewController, GDPDFViewDelegate{
    @IBOutlet var lecturePDFView: GDPDFView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       lecturePDFView.pdfViewDelegate = self
        // Do any additional setup after loading the view, typically from a nib.
     let path = URL(fileReferenceLiteralResourceName: "PDF.pdf")
        
    lecturePDFView.filePathURL = path
 
       
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func pdfView(_ view: (GDPDFContainerViewProperties & GDPDFViewProperties)!, didChangePage pageNumber: Int) {
   
     
        print(lecturePDFView.currentPageNumber)
    }
    
/*
    func pdfViewDidBeginLoading(_ view: (GDPDFContainerViewProperties & GDPDFViewProperties)!) {
       
    }
    
    func pdfViewDidEndLoading(_ view: (GDPDFContainerViewProperties & GDPDFViewProperties)!) {
        
    }
    func pdfView(_ view: (GDPDFContainerViewProperties & GDPDFViewProperties)!, didChangePage pageNumber: Int) {
    
    }
    
    */
    
/*
    /**
     Indicates when new PDF page is created, vectorImage object of OHVectormImage can be customized using class properties
     */
    (void)PDFView:(id<GDPDFViewProperties, GDPDFContainerViewProperties>)view configurePageVectorImage:(OHVectorImage *)vectorImage atPageNumber:(NSInteger)pageNumber;
*/
}

