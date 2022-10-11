import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pixel_project/ui/main/cubit/main_state.dart';
import 'package:flutter_pixel_project/utils/Colors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photo_view/photo_view.dart';

enum SingingCharacter { Accept, Reject, none }

class OrderPage extends StatefulWidget {
  final int index;
  final OrdersState state;
  OrderPage({Key? key, required this.index, required this.state}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  SingingCharacter? _character = SingingCharacter.none;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.primaryBlack.shade50,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: CustomColors.primaryBlack.shade50,
        elevation: 0,
        title: SvgPicture.asset('assets/gad_logo.svg', width: 110),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                child: Card(
                  color: Colors.white,
                  child: PhotoView(
                    backgroundDecoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    imageProvider: const CachedNetworkImageProvider(
                        "https://greatdubai.com/sell-car-rentals/wp-content/uploads/sites/4/2022/05/istockphoto-1157655660-612x612-1.jpg",
                        ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                //height: 100,
                child: Card(
                  child: Image.network(
                      "https://greatdubai.com/sell-car-rentals/wp-content/uploads/sites/4/2022/05/istockphoto-1157655660-612x612-1.jpg",
                      width: 100,
                      height: 100,
                      fit: BoxFit.contain),
                ),
              ),
              Row(
              children: <Widget>[
                  Flexible(
                    child: ListTile(
                      title: const Text('Accept', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.Accept,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Flexible(
                    child: ListTile(
                      title: const Text('Reject', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,)),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.Reject,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                //height: 100,
                child: Card(
                  child: Image.network(
                      "https://greatdubai.com/sell-car-rentals/wp-content/uploads/sites/4/2022/05/istockphoto-1157655660-612x612-1.jpg",
                      width: 100,
                      height: 100,
                      fit: BoxFit.contain),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}