
import 'package:bookly_app/Features/home/modelview/best_saller_books_cubit/best_saller_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

TextEditingController controller = TextEditingController();

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  @override
  void initState() {
    BlocProvider.of<BestSallerBooksCubit>(context).fetchSearchBooks(searchKey: controller.text);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        CustomTextField(
          controller:controller ,
          onPressed: (){
            BlocProvider.of<NewestBooksCubit>(context).fetchSearchBooks(searchKey:controller.text);
          },
        ),
        const SizedBox(height: 2,),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0,vertical: 10),
          child: Text(
            'Search Result',
            style: Styles.style18,
          ),
        ),
        const SizedBox(height: 16,),
        const Expanded(child: SearchResultListView()),
      ],
    );
  }
}


class SearchResultListView extends StatelessWidget {
  const SearchResultListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<NewestBooksCubit,NewestBooksStates>(
      buildWhen: (previous,current){
        return (current is SuccessSearchBooks|| current is LoadingSearchBooks) ;
      },
      builder: (context,state){
        if(state is SuccessSearchBooks) {
          return  ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount:state.searchBooks?.length ?? 0 ,
          itemBuilder: (context,index){
            return  Padding(
              padding: const EdgeInsets.symmetric( vertical: 1.0),
              child:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 10),
                child: NewestBookListViewItem(bookModel: state.searchBooks![index],),
              ),
            );
          },
        );
        }else if (state is FailureSearchBooks){
          return CustomErrorWidget(errorMessage: state.error);
        }else if (state is LoadingSearchBooks) {
          return const CustomCircularIndicator();
        }else {
          return Container();
        }
      },
    );
  }
}
