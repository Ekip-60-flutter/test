import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:newnew/pages/home/note_item.dart';
import 'package:newnew/shared/database/database_dao.dart';

class HomeBloc extends Bloc<EventHome, List<NoteItem>> {
  late HomeBloc budgetInterface = HomeBloc();

  final DatabaseDao _dao = DatabaseDao();

  late NoteItem noteItem;

  String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  HomeBloc() : super(<NoteItem>[]) {
    on<EventHome>((event, emit) async {
      switch (event) {
        case EventHome.AddNote:
          await _dao.insertItem(noteItem);
          emit(await bySort());
          break;
        case EventHome.UpdateNote:
          await _dao.updateItem(noteItem);
          emit(await bySort());
          break;
        case EventHome.DeleteNote:
          await _dao.delete(noteItem);
          emit(await bySort());
          break;
        case EventHome.DeleteAll:
          await _dao.deleteAll();
          emit(await bySort());
          break;
        case EventHome.GetAll:
          emit(await bySort());
          break;
        case EventHome.GetAllBySort:
          emit(await bySort());
          break;
        default:
          emit(<NoteItem>[]);
          break;
      }
    });
  }

  bySort() async {
    var data = await _dao.getAllItems();
    return data.where((i) => i.date == currentDate).toList();
  }
}

enum EventHome {
  AddNote,
  DeleteNote,
  UpdateNote,
  GetAll,
  GetAllBySort,
  DeleteAll
}
