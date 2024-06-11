import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'dart:io';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import '../../../utils/display_utils.dart';
import '../components/cbuttons.dart';
import '../components/isloading.dart';
import '../constants/cColors.dart';
import '../constants/image_constants.dart';
import '../resourses/text_styles.dart';

class PDFPreviewScreen extends StatefulWidget {
  PDFPreviewScreen();

  @override
  State<PDFPreviewScreen> createState() => _PDFPreviewScreenState();
}

class _PDFPreviewScreenState extends State<PDFPreviewScreen> {
  final ValueNotifier _isLoading = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   backgroundColor:cGrayColor4.withOpacity(.88),
      body: Column(
        children: [
          Expanded(
            // ignore: unnecessary_null_comparison
            child: SfPdfViewer.network(
              "https://drive.google.com/uc?export=download&id=1etuPv7NH9uPcm9eT0wC_4X9bLuaTVqSO",
              canShowScrollHead: false,
              canShowScrollStatus: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ValueListenableBuilder(
                    valueListenable: _isLoading,
                    builder: (context, value, child) {
                      return CButton(
                        width: getWidth(context) / 2,
                        color: cGrayColor,
                        borderColor: cGrayColor,
                        onPressed: () {
                          downloadfile(
                              "https://drive.google.com/uc?export=download&id=1etuPv7NH9uPcm9eT0wC_4X9bLuaTVqSO");
                        },
                        text: _isLoading.value
                            ? IsLoadingWidget()
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(ImageConstants.downloadIcon,color: cWhiteColor,),
                                  hGap(10),
                                  Text("Download PDF",
                                      style: TextStyles.getSubTita16(
                                          textColor: cWhiteColor)),
                                  vGap(30),
                                ],
                              ),
                      );
                    }),
              ],
            ),
          ),
          vGap(50),
        ],
      ),
    );
  }

  downloadfile(String filepath) async {
    try {
      var time = DateTime.now().microsecondsSinceEpoch;
      var path = "/storage/emulated/0/Download/Naresh-$time.pdf";
      var file = File(path);
      var res =
          await get(Uri.parse(filepath)); // var responce=await http.get(url),

      file.writeAsBytes(res.bodyBytes);
      showSuccessMessage(context, "Pdf succussfully downloaded");
    } catch (e) {
      showErrorMessage(context, "Error occured");
    }
  }
}
