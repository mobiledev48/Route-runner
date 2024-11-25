import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:route_runner/utils/strings.dart';
import 'package:pdf/widgets.dart' as pw;
class PdfPreviewScreen extends StatefulWidget {
  var data;
  var images;
  PdfPreviewScreen({required this.data,required this.images,Key? key}) : super(key: key);

  @override
  State<PdfPreviewScreen> createState() => _PdfPreviewScreenState();
}

class _PdfPreviewScreenState extends State<PdfPreviewScreen> {


  @override
  void initState() {

    super.initState();
  }




  Future<Uint8List> init()async{
    final pdf = pw.Document();
    final List<pw.Widget> pdfContent = [];


    pdfContent.add(pw.SizedBox(height: 20));





    final mainView =  pw.Container(
      child: pw.Column(
        children: [
         pw.Center(
           child:  pw.Text(
             StringRes.collectionDetail,
             style: const pw.TextStyle(
               color:  PdfColor.fromInt(0xFF000000),
               fontSize: 20,
             ),
           ),
         ),
         pw.Center(
           child:  pw.ListView.builder(

               itemCount: widget.data.length,
               itemBuilder: (context,i){
                 return  pw.Column(
                   children: [

                     pw.Padding(
                       padding: const pw.EdgeInsets.all(20),
                       child: pw.Column(
                         children: [

/*
                           pw.SizedBox(
                             height: 120,width: Get.width,
                             child: pw.ListView.builder(
                               direction: pw.Axis.horizontal,
                               itemCount:widget.images[i]["$i"]?.length ?? 0,
                               itemBuilder: (context, index) =>
                                   pw.Row(
                                     children: [
                                       pw.Container(
                                         height: 100,width: 100,
                                         decoration:  pw.BoxDecoration(
                                           image: pw.DecorationImage(
                                             image: pw.MemoryImage(
                                                 (widget.images[i]["$i"][index] ?? '')
                                             ),
                                             fit: pw.BoxFit.cover, // Choose the BoxFit that suits your needs
                                           ),
                                         ),
                                         *//*child:

                                                                       newCollectionController.addCampaignData[0].image != ""?
                                        //Image.file(File(newCollectionController.selectImage[index].toString()),height: 180)
                                       Image.file(File(newCollectionController.addCampaignData[0].image ?? ""),height: 180)
                                        :Image.asset(
                                                                         AssetRes.photo,
                                                                       ),*//*
                                       ),
                                       pw.SizedBox(width: 20,),
                                     ],
                                   ),
                             ),
                           ),*/

                           pw.SizedBox(
                             height: 20,
                           ),
                           pw.Container(
                             // height: Get.height * 0.25,
                             width: Get.width,

                             child: pw.Column(
                               children: [
                                 pw.Row(
                                   // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                   children: [
                                     pw.SizedBox(
                                       width: Get.width * 0.4,
                                       child: pw.Text(
                                         StringRes.machine,
                                         style: const pw.TextStyle(fontSize: 13,  color: PdfColor.fromInt(0XFF000000)),
                                       ),
                                     ),
                                     // SizedBox(
                                     //   width: Get.width * 0.35,
                                     // ),
                                     pw.Text(
                                       'Date: ${DateFormat('dd MMM, yyyy').format(DateTime.now())}',
                                       style: const pw.TextStyle(fontSize: 10,  color: PdfColor.fromInt(0XFF000000)),
                                     ),
                                     pw.SizedBox(
                                       width: Get.width * 0.02,
                                     ),
                                     pw.Text(
                                       'Time: ${DateFormat('h:mm a').format(DateTime.now())}',
                                       style: const pw.TextStyle(fontSize: 10,  color: PdfColor.fromInt(0XFF000000)),
                                     )
                                   ],
                                 ),
                                 pw.SizedBox(height: 20),
                                 pw.Row(
                                   mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                                   children: [
                                     pw.SizedBox(
                                       width:Get.width*0.15,
                                       child: pw.Text(

                                         '#${widget.data[i].machineNumber}-${widget.data[i].serialNumber}',
                                         maxLines: 1,
                                         style: const pw.TextStyle(fontSize: 14,  color: PdfColor.fromInt(0xFF4F4E69)),
                                       ),
                                     ),

                                     pw.Text(
                                       StringRes.current,
                                       style:const pw.TextStyle(fontSize: 14,  color: PdfColor.fromInt(0xFF4F4E69)),
                                     ),

                                     pw.Text(
                                       StringRes.previous,
                                       style: const pw.TextStyle(fontSize: 14,  color: PdfColor.fromInt(0xFF4F4E69)),
                                     ),

                                     pw.Text(
                                       StringRes.total,
                                       style: const pw.TextStyle(fontSize: 14,  color: PdfColor.fromInt(0xFF4F4E69)),
                                     ),

                                   ],
                                 ),

                                 pw.SizedBox(height: 10,),
                                 pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,children: [
                                   pw.Text(
                                     "In",
                                     style: const pw.TextStyle(fontSize: 15,  color: PdfColor.fromInt(0xFF000000)),
                                   ),
                                   pw.Text(
                                     "\$${widget.data[i].inCurrent}",
                                     style: const pw.TextStyle(fontSize: 15,  color: PdfColor.fromInt(0xFF000000)),
                                   ),
                                   pw.Text(
                                     "\$${widget.data[i].inPrevious}",
                                     style: const pw.TextStyle(fontSize: 15,  color: PdfColor.fromInt(0xFF000000)),
                                   ),
                                   pw.Text(
                                     "\$${calculateSubtractedValue(int.parse(widget.data[i].inCurrent ??"0"),
                                         int.parse(widget.data[i].inPrevious ?? '0'))}",
                                     style: const pw.TextStyle(fontSize: 15,  color: PdfColor.fromInt(0xFF000000)),
                                   ),
                                 ],),
                                 pw.SizedBox(height: 10,),
                                 pw.Row(mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,children: [
                                   pw.Text(
                                     "Out",
                                     style: const pw.TextStyle(fontSize: 15,  color: PdfColor.fromInt(0xFF000000)),
                                   ),
                                   pw.Text(
                                     "\$${widget.data[i].outCurrent}",
                                     style: const pw.TextStyle(fontSize: 15,  color: PdfColor.fromInt(0xFF000000)),
                                   ),
                                   pw.Text(
                                     "\$${widget.data[i].outPrevious}",
                                     style: const pw.TextStyle(fontSize: 15,  color: PdfColor.fromInt(0xFF000000)),
                                   ),
                                   pw.Text(
                                     "\$${calculateSubtractedValue(int.parse(widget.data[i].outCurrent ?? '0'),
                                         int.parse(widget.data[i].outPrevious ??'0'))}",
                                     style: const pw.TextStyle(fontSize: 15,  color: PdfColor.fromInt(0xFF000000)),
                                   ),
                                 ],),
                                 pw.SizedBox(height: 10,),
                                 pw.Padding(
                                   padding:  const pw.EdgeInsets.only(right: 0),
                                   child: pw.SizedBox(
                                     // width: Get.width * 0.1,
                                     child: pw.Row(
                                       mainAxisAlignment: pw.MainAxisAlignment.end,
                                       crossAxisAlignment: pw.CrossAxisAlignment.end,
                                       children: [
                                         pw.Text('Profit: ', style: const pw.TextStyle(fontSize: 15,  color: PdfColor.fromInt(0xFF000000)),),
                                         pw.Text(
                                           "\$ ${calculateTotalValue(
                                               calculateSubtractedValue(int.parse(widget.data[i].inCurrent ??'0'),
                                                   int.parse(widget.data[i].inPrevious ??'0')),
                                               calculateSubtractedValue(int.parse(widget.data[i].outCurrent ??'0'),
                                                   int.parse(widget.data[i].outPrevious ??'0'))
                                           )}",
                                           style: pw.TextStyle(color:  (calculateTotalValue(
                                               calculateSubtractedValue(int.parse(widget.data[i].inCurrent ??'0'),
                                                   int.parse(widget.data[i].inPrevious ??'0')),
                                               calculateSubtractedValue(int.parse(widget.data[i].outCurrent ??'0'),
                                                   int.parse(widget.data[i].outPrevious ??'0'))
                                           ) < 0)
                                               ? const PdfColor.fromInt(0xFFEF5350)
                                               : const PdfColor.fromInt(0xFF3A974C),),
                                         )
                                       ],
                                     ),
                                   ),
                                 )
                               ],
                             ),
                           ),
                         ],
                       ),
                     )
                   ],
                 );
               }),
         ),

        ],
      ),
    );

    pdfContent.add(pw.Container(child: mainView));

    pdf.addPage(
      pw.MultiPage(
        pageFormat: const PdfPageFormat(595.275590551181 , 841.8897637795275),


        build: (pw.Context context) {
          return <pw.Widget>[
            for (var content in pdfContent) pw.Container(child: content),
          ];
        },
      ),
    );
    return pdf.save();
  }

  convertData(path)async{
    await File(path).readAsBytes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfPreview(

        build: (context) => init(),
      ),
    );
  }


  num calculateTotalValue(num? In, num? out) {
    num total = (In ?? 0) - (out ?? 0);
    return total;
  }

  num calculateSubtractedValue(num? In, num? out) {
    num total = (In ?? 0) - (out ?? 0);
    return total;
  }

  double calculateProfit({
    double? previousIn,
    double? currentIn,
    double? previousOut,
    double? currentOut,
  }) {
    if(previousIn != 0.0 && currentIn != 0.0 && previousOut != 0.0 && currentOut != 0.0)
    {
      double totalIn = (currentIn ?? 0.0) - (previousIn ?? 0.0);
      double totalOut = (currentOut ?? 0.0) - (previousOut ?? 0.0);

      double profit = totalIn - totalOut;

    setState(() {

    });
      return profit;
    }
    else
    {



setState(() {

});

      return 0.0;
    }

  }
}
