import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../services/providers/home_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        return provider.loading
            ? Center(child: CircularProgressIndicator())
            : Column(
              children: [
                  Stack(
                    children:[ Container(
                      height: 300,
                      width: double.infinity,
                      child: Lottie.asset(
                        "assets/lottie/stack.json",
                        fit: BoxFit.cover,
                      ),
                    ),
                      ListTile(
                        title: Text('Country',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        trailing: Text(provider.location?.country ?? '',style: TextTheme.of(context).titleLarge,),
                      ),
                      Positioned(
                        top: 40,
                        left: 0,
                        right: 0,
                        child: ListTile(
                          title: Text('City',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          trailing: Text(provider.location?.name ?? '',style: TextTheme.of(context).titleLarge,),
                        ),
                      ),
                    ],
                  ),
                Expanded(
                  child: Container(

                    color: Colors.greenAccent,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text('Region',style: TextTheme.of(context).titleLarge,),
                          trailing: Text(provider.location?.region ?? '',style: TextTheme.of(context).titleLarge,),
                        ),
                        Divider(),
                        ListTile(
                          title: Text('Temperature (c)',style: TextTheme.of(context).titleLarge,),
                          trailing: Text(
                            provider.current?.tempC.toString() ?? '',style: TextTheme.of(context).titleLarge,
                          ),
                        ),
                        ListTile(
                          title: Text('Condition',style: TextTheme.of(context).titleLarge,),
                          trailing: Image.network(
                            provider.current?.condition?.icon?.replaceFirst(
                              '//',
                              'https://',
                            ) ??
                                '',
                          ),
                          leading:Text(provider.current?.condition?.text ?? '',style: TextTheme.of(context).titleLarge,),
                        ),
                        ListTile(
                          title: Text('Wind Speed (Kph)',style: TextTheme.of(context).titleLarge,),
                          trailing: Text(
                            provider.current?.windKph.toString() ?? '',style: TextTheme.of(context).titleLarge,
                          ),
                        ),
                        ListTile(
                          title: Text('Cloud',style: TextTheme.of(context).titleLarge,),
                          trailing: Text(
                            provider.current?.cloud.toString() ?? '',style: TextTheme.of(context).titleLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
      },
    );
  }
}
