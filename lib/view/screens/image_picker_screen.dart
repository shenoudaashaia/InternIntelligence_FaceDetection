import 'package:flutter/material.dart';
import 'package:image_detector/view/widgets/action_buttons_row.dart';
import 'package:image_detector/view/widgets/detection_results_card.dart';
import 'package:image_detector/view/widgets/image_display_card.dart';

import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../view_model/image_picker_view_model.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ImagePickerScreenState createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  // final ImagePickerViewModel _controller = ImagePickerViewModel();

  // @override
  // void initState() {
  //   super.initState();
  //   _controller.addListener(() {
  //     if (mounted) setState(() {});
  //   });
  // }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
       final _controller = Provider.of<ImagePickerViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        title:const Text(
          'Face Detector',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(
            icon:const Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
            onPressed: () => _showInfoDialog(context),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.indigo, Colors.indigo.shade50],
            stops:const [0.0, 0.3],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics:const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ImageDisplayCard(image: _controller.image),
                 const SizedBox(height: 20),
                  DetectionResultsCard(resultText: _controller.result,backgroundColor: _controller.getMoodColor(_controller.mood),),
                 const SizedBox(height: 20),
                  ActionButtonsRow(
                    onGalleryTap: () =>
                        _controller.pickImage(ImageSource.gallery),
                    onCameraTap: () =>
                        _controller.pickImage(ImageSource.camera),
                  ),
                 const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title:const Text('About Face Detector'),
        content:const Text(
          'This app uses ML Kit for Face Detection to analyze faces in images. '
          'It can detect multiple faces and provide information about facial features '
          'such as smiling probability and eye openness.',
        ),
        actions: [
          TextButton(
            child:const Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
