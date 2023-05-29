import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var resBodyIp,
      apiGetLocation,
      res1,
      res2,
      city,
      region,
      country,
      loc,
      org,
      postal,
      timeZone;

  fetchData() async {
    var apiGetIp = Uri.parse("https://api.ipify.org?format=json");
    res1 = await http.get(apiGetIp);
    resBodyIp = jsonDecode(res1.body)["ip"];
    apiGetLocation = Uri.parse("https://ipinfo.io/${resBodyIp.toString()}/geo");
    res2 = await http.get(apiGetLocation);
    city = jsonDecode(res2.body)["city"];
    region = jsonDecode(res2.body)["region"];
    country = jsonDecode(res2.body)["country"];
    loc = jsonDecode(res2.body)["loc"];
    org = jsonDecode(res2.body)["org"];
    postal = jsonDecode(res2.body)["postal"];
    timeZone = jsonDecode(res2.body)["timezone"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        foregroundColor: Colors.white,
        title: const Text(
          "Hacking...!",
          style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
        elevation: 0.0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.purple,
              Colors.brown,
            ],
          ),
        ),
        child: Center(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  textAlign: TextAlign.center,
                  "Your ip Adress is: $resBodyIp   😈 \n\nYour Operating GSM's City is: $city\n\nYour Operating GSM's Region is: $region\n\nYour Country is: $country\n\nYour Operating GSM's LOC is: $loc\n\nYour Operating GSM's Name is: $org\n\nYour Postal Adress is: $postal\n\nYour Time Zone is: $timeZone",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(Colors.brown),
                    ),
                    onPressed: () {
                      setState(() {
                        fetchData();
                      });
                    },
                    child: const Text("Load Data!"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
