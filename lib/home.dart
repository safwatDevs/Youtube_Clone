import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const categories = ['All', 'Cars', 'Racing', 'Technology', 'Smart Things'];
    const shortVideos = [
      {'title': 'لازم تبتدي تستعد من دلوقتي!', 'thumbnail': 'sh1'},
      {'title': 'ازاي تنجو', 'thumbnail': 'sh2'},
      {
        'title':
            'لو فاشل زيي في التخطيط لرمضان -  متجَّوِدش | ياسر ممدوح - Yasser Mamdouh',
        'thumbnail': 'sh3',
      },
      {'title': 'How to oil the shifters', 'thumbnail': 'sh4'},
    ];
    const videos = [
      {
        'title': 'منتهي الصلاحية  ... EXPIRED',
        'channel': 'Mohamed Zazoaa محمد زعزوع',
        'views': 1800,
        'since': 16,
        'thumbnail': 'th2',
        'channel_photo': 'ch2',
      },
      {
        'title': 'غير مكانك… عشان ربنا يغيّر حالك',
        'channel': 'ما عُلمته | Ma Eulmtah',
        'views': 6600,
        'since': 9,
        'thumbnail': 'th1',
        'channel_photo': 'ch1',
      },
      {
        'title': 'الحلقة الثانية | التوبة بداية | عالمغرب (٣)',
        'channel': 'إيه المشكلة',
        'views': 150000,
        'since': 21,
        'thumbnail': 'th3',
        'channel_photo': 'ch3',
      },
    ];

    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        toolbarHeight: screenHeight * 0.105,
        titleSpacing: 0,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.only(left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/logo.png', height: 25),

                  Row(
                    children: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.cast)),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.notifications_none),
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 36,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 10),
                scrollDirection: Axis.horizontal,
                children: categories
                    .map(
                      (title) => InkWell(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 6),
                          padding: EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 7,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(204, 226, 226, 226),
                          ),
                          child: Text(
                            title,
                            style: TextStyle(
                              color: Color.fromARGB(255, 15, 15, 15),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(

        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(right: 15, left: 15, top: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/shorts_logo.png', height: 36),
                      IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
                    ],
                  ),
                  SizedBox(height: 10),
                  GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 532 / 806,
                    children: shortVideos
                        .map(
                          (video) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            clipBehavior: Clip.hardEdge,
                            child: Stack(
                              children: [
                                Image.asset(
                                  'assets/images/${video['thumbnail']}.png',
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.fill,
                                ),
                                Positioned.fill(
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.transparent,
                                          Colors.black.withValues(alpha: 0.5),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 8,
                                  left: 8,
                                  right: 8,
                                  child: Text(
                                    video['title']!,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: videos.length,
              itemBuilder: (context, index) {
                final video = videos[index];
                return InkWell( onTap: (){},
                  child: Container(
                    padding: EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      children: [
                        Image.asset('assets/images/${video['thumbnail']}.png'),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            SizedBox(width: 12),
                            CircleAvatar(
                              radius: 20,
                              backgroundImage:AssetImage('assets/images/${video['channel_photo']}.jpg'),
                            ),
                            SizedBox(width: 12,),
                            Expanded(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text('${video['title']}', style: TextStyle(fontSize: 16),),
                  
                                  ],
                  
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width:MediaQuery.of(context).size.width * 0.7,
                                          child: Text('${video['channel']} · ${video['views']} views · ${video['since']} hours ago', style: TextStyle(fontSize: 13), textAlign: TextAlign.left, overflow: TextOverflow.visible,)),
                  
                                    ],
                                  )
                  
                                ],
                              ),
                            ),
                            IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
