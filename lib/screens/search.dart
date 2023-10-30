import 'package:nutricao/items/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nutricao/screens/main.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  static List previousSearchs = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xFFFAF1E4),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            // Search Bar
            SingleChildScrollView(
              child: Container(
                color: const Color(0xFFFAF1E4),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Color(0xFF435334),
                          )),
                      Expanded(
                        child: CostomTextFormFild(
                          hint: "Pesquisar",
                          prefixIcon: IconlyLight.search,
                          controller: searchController,
                          filled: true,
                          suffixIcon: searchController.text.isEmpty
                              ? null
                              : Icons.cancel_sharp,
                          onTapSuffixIcon: () {
                            searchController.clear();
                          },
                          onChanged: (pure) {
                            setState(() {});
                          },
                          onEditingComplete: () {
                            previousSearchs.add(searchController.text);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MainPage()));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 8,
            ),

            // Previous Searches
            SingleChildScrollView(
              child: Container(
                color: const Color.fromARGB(225, 239, 230, 216),
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: previousSearchs.length,
                    itemBuilder: (context, index) =>
                        previousSearchsItem(index)),
              ),
            ),
            const SizedBox(
              height: 50,
            ),

            // Search Suggestions
            Container(
                width: double.infinity,
                color: const Color(0xFFFAF1E4),
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pesquisas Sugeridas",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          searchSuggestionsTiem("sushi"),
                          searchSuggestionsTiem("sanduíche"),
                          searchSuggestionsTiem("café")
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          searchSuggestionsTiem("massa"),
                          searchSuggestionsTiem("maça"),
                          searchSuggestionsTiem("amendoim")
                        ],
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    ));
  }

  previousSearchsItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        onTap: () {},
        child: Dismissible(
          key: GlobalKey(),
          onDismissed: (DismissDirection dir) {
            setState(() {});
            previousSearchs.removeAt(index);
          },
          child: Row(
            children: [
              const Icon(
                IconlyLight.time_circle,
                color: Color(0xFF435334),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                previousSearchs[index],
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: const Color(0xFF2E3E5C)),
              ),
              const Spacer(),
              const Icon(
                Icons.call_made_outlined,
                color: Color(0xFF435334),
              )
            ],
          ),
        ),
      ),
    );
  }

  searchSuggestionsTiem(String text) {
    return Container(
      margin: const EdgeInsets.only(left: 6),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: BoxDecoration(
          color: const Color(0xFFCEDEBD),
          borderRadius: BorderRadius.circular(30)),
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: const Color(0xFF2E3E5C)),
      ),
    );
  }
}
