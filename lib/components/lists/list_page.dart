import 'package:flutter/material.dart';
import 'package:flutter_view_controller/models/view_abstract.dart';
import 'package:loadmore/loadmore.dart';

class ListPage<T extends ViewAbstract> extends StatefulWidget {
  final T view_abstract;
  const ListPage({Key? key, required this.view_abstract}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState<T extends ViewAbstract> extends State<ListPage> {
  late List<T> list = [];
  int get count => list.length;
  int page = 0;

  @override
  void initState() {
    super.initState();
    _loadMore();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      child: RefreshIndicator(
        onRefresh: _refresh,
        child: LoadMore(
          isFinish: count >= 60,
          onLoadMore: _loadMore,
          whenEmptyLoad: false,
          delegate: const DefaultLoadMoreDelegate(),
          textBuilder: DefaultLoadMoreTextBuilder.chinese,
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return list[index].getCardListView(context);
            },
            itemCount: count,
          ),
        ),
      ),
    );
  }

  Future<bool> _loadMore() async {
    print("onLoadMore");
    await Future.delayed(const Duration(seconds: 0, milliseconds: 2000));
    load();
    return true;
  }

  Future<void> _refresh() async {
    page = 0;
    await Future.delayed(const Duration(seconds: 0, milliseconds: 2000));
    list.clear();
    load();
  }

  Future<void> loadMoreList() async {
    List? c = await widget.view_abstract.listCall(5, page);
    if (c != null) {
      list.addAll(List<T>.from(c));
    }
  }

  void load() async {
    print("load");
    await loadMoreList();
    setState(() {});
  }
}