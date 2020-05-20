import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CardSwiper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    return Container(
      child: Swiper(
      itemHeight: _screenSize.height * 0.5,
      itemWidth: _screenSize.width * 0.7,
      itemBuilder: (BuildContext context,int index){
        return new Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
      },
      itemCount: 3,
      pagination: new SwiperPagination(),
      control: new SwiperControl(),
      ),
    );
  }
}