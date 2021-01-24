import 'package:countries_app/ui/tabs/all/bloc/all_countries_bloc.dart';
import 'package:countries_app/ui/widgets/bottom_loader.dart';
import 'package:countries_app/ui/widgets/countries_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllCountriesList extends StatefulWidget {
  @override
  _AllCountriesState createState() => _AllCountriesState();
}

class _AllCountriesState extends State<AllCountriesList> {
  final _scrollController = ScrollController();
  AllCountriesBloc _countriesBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _countriesBloc = context.read<AllCountriesBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllCountriesBloc, AllCountriesState>(
      builder: (context, state) {
        switch (state.status) {
          case AllCountriesStatus.failure:
            return const Center(
                child: Text(
                    'Failed to fetch posts, Please check your internet connection.'));
          case AllCountriesStatus.success:
            if (state.countries.isEmpty) {
              return const Center(child: Text('no posts'));
            }
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= state.countries.length
                    ? BottomLoader()
                    : CountriesListItem(
                        countryData: state.countries[index]);
              },
              itemCount: state.hasReachedMax
                  ? state.countries.length
                  : state.countries.length + 1,
              controller: _scrollController,
            );
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) _countriesBloc.add(CountriesFetched());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
