import 'package:nutricao/items/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nutricao/screens/main.dart';
import 'package:nutricao/BD/database_helper.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Map<String, dynamic>> searchResults = [];

  void searchUsers(String searchTerm) async {
    setState(() {
      searchResults = []; // Limpa os resultados anteriores
    });

    if (searchTerm.isNotEmpty) {
      final results = await Database.consultaUsuariosPorNome(searchTerm);
      setState(() {
        searchResults = results;
      });
    }
  }

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
            Container(
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
                      ),
                    ),
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
                        onChanged: (value) {
                          searchUsers(value);
                        },
                        onEditingComplete: () {
                          previousSearchs.add(searchController.text);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MainPage(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 8,
            ),

            // Resultados da pesquisa
            if (searchResults.isNotEmpty)
              Container(
                height: 200,
                child: ListView.builder(
                  itemCount: searchResults.length,
                  itemBuilder: (context, index) {
                    final user = searchResults[index];
                    return ListTile(
                      title: Text(user['nome']),
                      // Adicione outros elementos relevantes do usuário aqui
                    );
                  },
                ),
              ),

            // Previous Searches
            SingleChildScrollView(
              child: Container(
                color: const Color.fromARGB(225, 239, 230, 216),
                child: Expanded(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: previousSearchs.length,
                    itemBuilder: (context, index) => previousSearchsItem(index),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
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
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      const SizedBox(
                        height: 15,
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
