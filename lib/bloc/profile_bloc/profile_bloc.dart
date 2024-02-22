import 'dart:async';
import 'dart:convert';
import 'package:admin_app/components/config.dart';
import 'package:admin_app/dao/profile_dao.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  late ProfileDao profileDao;
  ProfileBloc() : super(ProfileInitial()) {
    profileDao = ProfileDao();
    on<FetchProfileEvent>((event, emit) async{
      await mapFetchProfileEvent(event, emit);
    });
  }

  Future<void> mapFetchProfileEvent(
      FetchProfileEvent event, Emitter<ProfileState> emit) async {
    try{
      emit(const ProfileLoading());

      var response = await profileDao.fetchProfile();

      Map<String,dynamic> jsonDecoded = jsonDecode(response.body);

      if(response.statusCode == 200 && jsonDecoded['status'] == true){

        String firstName = jsonDecoded["data"]["first_name"];
        String lastName = jsonDecoded["data"]["last_name"];

        Config.firstName = firstName;
        Config.lastName = lastName;

        emit(FetchProfileSuccess(firstName: firstName,lastName: lastName));
      } else{
        String message = jsonDecoded["message"];
        emit(FetchProfileFailed(message: message));
      }

    }catch(error){
      emit(FetchProfileFailed(message: "Something Went wrong"));
    }
  }

}
