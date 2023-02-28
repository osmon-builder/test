import 'package:card_swiper/card_swiper.dart';
import 'package:baguer/models/people.dart';
import 'package:flutter/material.dart';



class PeopleList extends StatelessWidget {
   
  const PeopleList({super.key, required this.results});

  final List<Result> results;
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return  
    Padding(
      padding: const EdgeInsets.all(0.2 ),
      child: SizedBox(
        width: double.infinity,
        height: size.height * 2,
        child: Swiper(
          itemCount: results.length,
          layout: SwiperLayout.STACK,
          itemWidth: size.width *0.6,
          itemHeight: size.height * 0.4,
          itemBuilder: ( _  , int index) {
    
            final result = results[index];
            result.id = 'swiper-${result.id}';
    
        
          
            return Center(
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, 'details', arguments: result ),
                child: Hero(
                  tag: result.phone,
                  child: Stack(
                    children: [
                     ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child:  FadeInImage(
                        placeholder: const AssetImage('assets/no-image.jpg'),
                        image: NetworkImage(result.picture.large, scale: 0.1),
                        alignment: Alignment.center,
                        ),
                    ),
                    Column(
                      children:  [
                        Text(
                          result.name.first, 
                          style: 
                          const TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          ),
                          ),
                          Text(
                            result.name.last,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 25
                            ),
                            )
                      ],
                      
                    )
                    ],
                    
                  ),
                ),
              ),
            );
          },
          ),
      ),
    );
      //   body: AuthBackground(
      // child: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       Padding(
      //         padding: EdgeInsets.all(25),
      //         child: Container(
      //           margin:  EdgeInsets.only(top: 300),
      //           decoration: BoxDecoration(
      //             color: Colors.white,
      //             borderRadius:  BorderRadius.circular(16)
      //           ),
      //           child: Padding(
      //             padding:  EdgeInsets.all(10.0),
      //             child: Row(
      //               children: [
      //                   Icon(Icons.favorite),
      //                   SizedBox(width: 8,),
      //                 Column(
      //                   children: [
      //                   Text('nombre persona'),
      //                   Text('apellido persona'),
      //                   ],
                        
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //       )  
      //     ],
      //   ),
      // )
      // ),
    
  }
}
