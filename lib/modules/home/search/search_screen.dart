import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/components/components.dart';
import '../plant details/plant_details_screen.dart';

class SearchPage extends StatefulWidget {
  final List<Map<String, dynamic>> items;
  SearchPage({required this.items});
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<Map<String, dynamic>> searchResults = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    searchResults = List.from(widget.items); // عرض كل العناصر عند فتح الصفحة
    isLoading = false;
    Future.delayed(Duration(milliseconds: 300), () {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  void _search(String query) {
    if (query.isEmpty) {
      setState(() {
        searchResults = List.from(widget.items); // إعادة كل العناصر إذا كان البحث فارغًا
        isLoading = false;
      });
      return;
    }

    setState(() {
      isLoading = true;
    });

    Future.delayed(Duration(milliseconds: 500), () {
      if (_searchController.text.trim().toLowerCase() != query.trim().toLowerCase()) {
        return;
      }

      setState(() {
        searchResults = widget.items.where((item) {
          String floorText = "floor ${item["floor"]}".toLowerCase();
          String cellText = "cell ${item["cell"]}".toLowerCase();
          String combinedText = "$floorText $cellText";

          List<String> splitWords(String text) {
            return RegExp(r'[a-zA-Z]+|\d+')
                .allMatches(text.toLowerCase())
                .map((match) => match.group(0)!)
                .toList();
          }

          List<String> queryWords = splitWords(query);
          List<String> itemWords = splitWords(combinedText);

          return queryWords.every((word) => itemWords.contains(word));
        }).toList();

        isLoading = false;
      });
    });
  }



  Widget _buildLoadingSkeleton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 104,
                height: 104,
                decoration: BoxDecoration(
                  color: Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 165,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: 100,
                      height: 18,
                      decoration: BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: TextField(
                controller: _searchController,
                focusNode: _focusNode,
                onChanged: _search,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.search,
                style: GoogleFonts.reemKufi(
                    fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xFF414042)),
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back, size: 28, color: Color(0xFF484C52)),
                        ),
                        Container(width: 1.5, height: 22, decoration: BoxDecoration(color: Color(0xFF979797),borderRadius: BorderRadius.circular(1.5)),),
                        SizedBox(width: 8),
                      ],
                    ),
                  ),
                  prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                    icon: Icon(Icons.cancel_outlined, color: Color(0xFF414042)),
                    onPressed: () {
                      _searchController.clear();
                      setState(() {
                        searchResults = [];
                      });
                    },
                  )
                      : null,
                  hintText: "Search",
                  hintStyle: GoogleFonts.reemKufi(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF414042),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: Color(0xFF414042),width: 1.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: Color(0xFF414042),width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: Color(0xFF414042), width: 1.5),
                  ),
                ),
                cursorColor: Color(0xFF414042),
              ),
            ),
            SizedBox(height: 5,),
            Expanded(
              child: isLoading
                  ? ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => _buildLoadingSkeleton(),
              )
                  : searchResults.isEmpty
                  ? Center(
                child: Text(
                  "No results found",
                  style: GoogleFonts.reemKufi(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF414042),
                  ),
                ),
              )
                  : ListView.separated(
                itemCount: searchResults.length + 2,
                itemBuilder: (context, index) {
                  if (index == 0 || index == searchResults.length + 1) {
                    return SizedBox(height: 5);
                  }
                  var item = searchResults[index - 1];
                  return buildAllHealthPlantItem(
                    context: context,
                    floor: item["floor"],
                    cell: item["cell"],
                    healthPercentage: item["healthPercentage"],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 10),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
