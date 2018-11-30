import 'package:flutter/material.dart';

class ModalBanner extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Image.network('https://github.com/flutter/website/blob/master/src/_includes/code/layout/lakes/images/lake.jpg?raw=true')
    );
  }

}