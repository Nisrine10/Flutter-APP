
import 'package:aeapp/models/channels.dart';
import 'package:aeapp/models/channels.dart';
import 'package:aeapp/services/data_service.dart';
import 'package:aeapp/views/screens/homescreenV.dart';
import 'package:flutter/material.dart';


class ChannelPage extends StatefulWidget {
  const ChannelPage({Key? key}) : super(key: key);

  @override
  State<ChannelPage> createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
  TextEditingController _ctr = TextEditingController();
  late Future<List<Chan>> Channels;

  @override
  void initState(){
    setState(() {
      Channels = getChannels('Pr Habib Ayad');
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Channels'),),
      body: Container(
        margin:EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: _ctr,
              style: TextStyle(fontSize: 18,color: Colors.purple),
              decoration: InputDecoration(labelText: 'Mot cle'),
            ),
            ElevatedButton(onPressed: (){
              setState(() {
                Channels = getChannels(_ctr.text);

              });

            }, child: Icon(Icons.search,size: 30,)),
            Expanded(child: FutureBuilder<List<Chan>>(
              future: Channels,
              builder: (context,snp){
                if(snp.hasData){
                  print("entrer");
                  return ListView.builder(
                    itemCount: snp.data!.length,
                    itemBuilder: (context,index){
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeS(id:snp.data![index].channelid)),
                          );
                        },
                        child: Card(
                          elevation: 8,
                          child: Container(
                            width: double.infinity,
                            margin: EdgeInsets.all(40),
                            height: 200,
                            child: Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right:40),
                                  child: Align(
                                    alignment: Alignment(-1,0),
                                    child: CircleAvatar(backgroundImage: NetworkImage(snp.data![index].thumbnails),
                                      radius: 50,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Align(
                                    alignment: Alignment(0.5,-0.0),
                                    child: Text(snp.data![index].title,style: TextStyle(fontSize: 18,color: Colors.purple),),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }else{
                  return Text('No Data',style: TextStyle(color: Colors.red),);
                }
              },
            ))


          ],
        ),
      ),
    );
  }
}
