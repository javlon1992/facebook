
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomePage extends StatefulWidget {
  static String id="home_page";
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool theme=false;
  List name=["Juana","Martin","Karen","Joshua","Andrew","Maisey"];
  List familya=["Handel","Randolph","Castillo","Lawrence","Parker","Humphrey"];
  List status=["You: What's man!","You: Ok, thanks!","You: Ok, see you in To!","Have a good day!","The business plan loo..."];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:theme? Colors.black:Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 64,
        leading: Container(
          margin: EdgeInsets.all(7),
          //height: 40, width: 40,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              //borderRadius: BorderRadius.circular(100),
              image: DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/images/img_4.png"))),
        ),
        title: Text("Chats",style: TextStyle(color: theme?Colors.white:Colors.black,fontSize: 30,fontWeight: FontWeight.w700),),
        actions: [
          Container(
            height: 40,width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme? Colors.white.withOpacity(0.2) : Colors.black.withOpacity(0.04),
            ),
            child:  IconButton(
              onPressed: (){},
              icon: Icon(Icons.photo_camera,color: theme?Colors.white:Colors.black,),
            ),
          ),
          Container(
            height: 40,width: 40,
            margin: EdgeInsets.only(right: 15,left: 10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: theme? Colors.white.withOpacity(0.2) : Colors.black.withOpacity(0.04),
            ),  
            child: IconButton(
              onPressed: (){
                setState(() {theme = !theme;});
              },
              icon: Icon(Icons.edit_rounded,color:theme? Colors.white:Colors.black,),),
          ),
        ],
      ),
      body: ListView(
        children: [
          /// #Search
          Container(
            margin: const EdgeInsets.only(left: 16, right: 16, bottom: 8,top: 4,),
            height: 36,
            decoration: BoxDecoration(
              color: theme?Colors.grey.shade700:Colors.black.withOpacity(0.05),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color:theme?Colors.white:Colors.black,
                  ),
                  border: InputBorder.none,
                  hintText: "Search", hintStyle: TextStyle(color:theme? Colors.white:Colors.black)

              ),
            ),
          ),
           /// #ListView horizontal
           Container(
             color: Colors.transparent,
             height: 106,
             child: ListView.builder(
               shrinkWrap: true,
               physics: const BouncingScrollPhysics(),
               scrollDirection: Axis.horizontal,
               itemCount: 6,
                 itemBuilder: (context,index){
                   return buildAvatar(index);
                 }
                 ),
           ),
          /// #ListView vertical
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
              itemBuilder: (context,index){
              return buildSlidable(index);
              }),
        ],
      ),
    );
  }

  Slidable buildSlidable(int index) {
    return Slidable(
              // The start action pane is the one at the left or the top side.
              startActionPane: ActionPane(
                // A motion is a widget used to control how the pane animates.
                motion: const ScrollMotion(),
                children: [
                  Spacer(),
                  MaterialButton(onPressed: (){},
                    shape: CircleBorder(),
                    color: Colors.blue,
                    height: 40, minWidth: 40,
                    child: Icon(Icons.camera_alt, color: Colors.white, size: 20),
                  ),
                  MaterialButton(onPressed: (){},
                  shape: CircleBorder(),
                    elevation: 0,
                  color:theme? Colors.white.withOpacity(0.2) :Colors.black.withOpacity(0.04),
                  height: 40, minWidth: 40,
                    child: Icon(Icons.videocam, color:theme? Colors.white :Colors.black, size: 20),
                  ),
                  MaterialButton(onPressed: (){},
                    shape: CircleBorder(),
                    elevation: 0,
                    color:theme? Colors.white.withOpacity(0.2) :Colors.black.withOpacity(0.04),
                    height: 40, minWidth: 40,
                    child: Icon(Icons.call, color:theme? Colors.white : Colors.black, size: 20),
                  ),
                ],
              ),

              // The end action pane is the one at the right or the bottom side.
              endActionPane: ActionPane(
                motion: ScrollMotion(),
                children: [
                  MaterialButton(onPressed: (){},
                    shape: CircleBorder(),
                    elevation: 0,
                    color:theme? Colors.white.withOpacity(0.2) : Colors.black.withOpacity(0.04),
                    height: 40, minWidth: 40,
                    child: Icon(Icons.menu, color:theme? Colors.white : Colors.black, size: 20),
                  ),
                  MaterialButton(onPressed: (){},
                    shape: CircleBorder(),
                    elevation: 0,
                    color:theme? Colors.white.withOpacity(0.2) : Colors.black.withOpacity(0.04),
                    height: 40, minWidth: 40,
                    child: Icon(Icons.notifications, color:theme? Colors.white : Colors.black, size: 20),
                  ),
                  MaterialButton(onPressed: (){},
                    shape: CircleBorder(),
                    elevation: 0,
                    color: Colors.red,
                    height: 40, minWidth: 40,
                    child: Icon(Icons.delete, color: Colors.white, size: 20),
                  ),
                ],
              ),

              // The child of the Slidable is what the user sees when the
              // component is not dragged.
              child: buildListTile(index),
            );
  }

  ListTile buildListTile(int index) {
    return ListTile(
              leading: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    //borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/img_${index%6}.png"))),
              ),
              title: Text("${name[index%6]} ${familya[index%6]}",style: TextStyle(color:theme ? Colors.white : Colors.black,fontSize: 17,letterSpacing: 0.4,),),
              subtitle: Text(status[index%5],style: TextStyle(color: Colors.grey),),
              trailing: Container(
                height: 18,width: 18,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1.5,color: Colors.grey),
                ),
                  child:index==0 ? SizedBox.shrink() : Icon(Icons.done,size: 15,color: Colors.grey,)),
            );
  }

  Container buildAvatar(int index) {
    return Container(
      margin: EdgeInsets.all(14),
      child: Column(
        children: [
          index==0? Container(
            height: 52,
            width: 52,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
             color: Colors.grey.withOpacity(0.2),
            ),
            child: Icon(Icons.add,color:theme? Colors.white: Colors.black,),
          )
              : Stack(
            children: [
              Container(
                height: 52,
                width: 52,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    //borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/img_$index.png"))),
              ),
              Positioned(
                  right: 1,
                  bottom: 1,
                  child: Container(
                    height: 17,
                    width: 17,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.green,
                        border: Border.all(
                          width: 3,
                          color:theme? Colors.black:Colors.white,
                        )),
                  )),
            ],
          ),
          const SizedBox(height: 7),
          Text(index==0?"Your story":name[index],
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
