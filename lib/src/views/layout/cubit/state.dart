abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppGetUserLoadingState extends AppStates {}

class AppGetUserSuccessState extends AppStates {}

class AppGetUserErrorState extends AppStates {
  final String error;

  AppGetUserErrorState(this.error);
}

class SocialNotificationLoadingState extends AppStates {}

class SociallNotificationSuccessState extends AppStates {}

class SociallNotificationErrorState extends AppStates {
  final String error;

  SociallNotificationErrorState(this.error);
}

class GetSocialNotificationLoadingState extends AppStates {}

class GetSociallNotificationSuccessState extends AppStates {}

class UpdateSociallNotificationSuccessState extends AppStates {}

class GetSociallNotificationErrorState extends AppStates {
  final String error;

  GetSociallNotificationErrorState(this.error);
}

class SocialChangeBottomNav extends AppStates {}






class AppGetUserFriendLoadingState extends AppStates {}

class AppGetUserFriendSuccessState extends AppStates {}

class AppGetUserFriendErrorState extends AppStates {
  final String error;

  AppGetUserFriendErrorState(this.error);
}

class AppGetAllUserLoadingState extends AppStates {}

class AppGetAllUserSuccessState extends AppStates {}

class AppGetAllUserErrorState extends AppStates {
  final String error;

  AppGetAllUserErrorState(this.error);
}

class AppGetAllVideoLoadingState extends AppStates {}

class AppGetAllVideoSuccessState extends AppStates {}

class AppGetAllVideoErrorState extends AppStates {
  final String error;

  AppGetAllVideoErrorState(this.error);
}

class AppGetAllUserTokenLoadingState extends AppStates {}

class AppGetAllUserTokenSuccessState extends AppStates {}

class AppGetAllUserTokenErrorState extends AppStates {
  final String error;

  AppGetAllUserTokenErrorState(this.error);
}

class AppChangeBottomNav extends AppStates {}

class AppNewPostState extends AppStates {}

class ChangeAppModeState extends AppStates {}

class AppProfileImageSuccessState extends AppStates {}

class AppProfileImageErrorState extends AppStates {}

class AppCoverSuccessState extends AppStates {}

class AppCoverErrorState extends AppStates {}

class AppAddSubPostErrorState extends AppStates {}

class AppAddSubPostLoadingState extends AppStates {}

class AppAddSubPostSuccessState extends AppStates {}

class AppAddSubAlbumErrorState extends AppStates {}

class AppAddSubAlbumLoadingState extends AppStates {}

class AppAddSubAlbumSuccessState extends AppStates {}

class AppGetSubPostErrorState extends AppStates {}

class AppGetSubPostLoadingState extends AppStates {}

class AppGetSubPostSuccessState extends AppStates {}

class AppGetSubPostTempErrorState extends AppStates {}

class AppGetSubPostTempLoadingState extends AppStates {}

class AppGetSubPostTempSuccessState extends AppStates {}

class AppGetEditSubPostErrorState extends AppStates {}

class AppGetEditSubPostLoadingState extends AppStates {}

class AppGetEditSubPostSuccessState extends AppStates {}

class AppSaveEditSubPostLoadingState extends AppStates {}

class AppSaveEditSubPostSuccessState extends AppStates {}

class AppSaveEditSubPostErrorState extends AppStates {}

class AppGetEditPostErrorState extends AppStates {}

class AppGetEditPostLoadingState extends AppStates {}

class AppGetEditPostSuccessState extends AppStates {}

class AppAllPhotosErrorState extends AppStates {}

class AppAllPhotosLoadingState extends AppStates {}

class AppAllPhotosSuccessState extends AppStates {}

class AppUploadProfileImageLoadingState extends AppStates {}

class AppUploadProfileImageSuccessState extends AppStates {}

class AppUploadProfileImageErrorState extends AppStates {}

class AppUploadCoverImageLoadingState extends AppStates {}

class AppUploadCoverSuccessState extends AppStates {}

class AppUploadCoverErrorState extends AppStates {}

class AppUserUpdateLoadingState extends AppStates {}

class AppUserUpdateSuccessState extends AppStates {}

class AppUserUpdateErrorState extends AppStates {}

class AppCreatePostSuccessState extends AppStates {}

class AppCreatePostErrorState extends AppStates {}

class AppCreatePostLoadingState extends AppStates {}

class AppCreateAlbumSuccessState extends AppStates {}

class AppCreateAlbumErrorState extends AppStates {}

class AppCreateAlbumLoadingState extends AppStates {}

class AppCreateFilePostSuccessState extends AppStates {}

class AppCreateFilePostErrorState extends AppStates {}

class AppPostSuccessState extends AppStates {}

class AppPostErrorState extends AppStates {}

class AppRemovePostState extends AppStates {}

class DeletePostSuccessState extends AppStates {}

class DeleteSubPostSuccessState extends AppStates {}

class AppGetPostsLoadingState extends AppStates {}

class AppGetPostsSuccessState extends AppStates {}

class AppGetPostsErrorState extends AppStates {
  final String error;

  AppGetPostsErrorState(this.error);
}

class AppGetDetailPostsLoadingState extends AppStates {}

class AppGetDetailPostsSuccessState extends AppStates {}

class AppGetDetailPostsErrorState extends AppStates {
  final String error;

  AppGetDetailPostsErrorState(this.error);
}

class AppLikePostsSuccessState extends AppStates {}

class AppLikePostsLoadingState extends AppStates {}

class AppLikePostsErrorState extends AppStates {
  final String error;

  AppLikePostsErrorState(this.error);
}

class AppLikePostsSubSuccessState extends AppStates {}

class AppLikePostsSubLoadingState extends AppStates {}

class AppLikePostsSubErrorState extends AppStates {
  final String error;

  AppLikePostsSubErrorState(this.error);
}

class AppUserLikePostsLoadingState extends AppStates {}

class AppUserLikePostsErrorState extends AppStates {
  final String error;

  AppUserLikePostsErrorState(this.error);
}

class AppUserLikePostsSubSuccessState extends AppStates {}

class AppUserLikePostsSubLoadingState extends AppStates {}

class AppUserLikePostsSubErrorState extends AppStates {
  final String error;

  AppUserLikePostsSubErrorState(this.error);
}

class AppUserDisLikePostsSuccessState extends AppStates {}

class AppUserDisLikePostsLoadingState extends AppStates {}

class AppUserDisLikePostsErrorState extends AppStates {
  final String error;

  AppUserDisLikePostsErrorState(this.error);
}

class AppDisLikePostsSubSuccessState extends AppStates {}

class AppDisLikePostsSubLoadingState extends AppStates {}

class AppDisLikePostsSubErrorState extends AppStates {
  final String error;

  AppDisLikePostsSubErrorState(this.error);
}




class AppCommentLoadingState extends AppStates {}

class AppCommentSuccessState extends AppStates {}

class AppCommentErrorState extends AppStates {
  final String error;

  AppCommentErrorState(this.error);
}

class AppNotificationLoadingState extends AppStates {}

class ApplNotificationSuccessState extends AppStates {}

class ApplNotificationErrorState extends AppStates {
  final String error;

  ApplNotificationErrorState(this.error);
}

class GetAppNotificationLoadingState extends AppStates {}

class GetApplNotificationSuccessState extends AppStates {}

class UpdateApplNotificationSuccessState extends AppStates {}

class GetApplNotificationErrorState extends AppStates {
  final String error;

  GetApplNotificationErrorState(this.error);
}

class GetCommentLoadingState extends AppStates {}

class GetCommentSuccessState extends AppStates {}

class GetCommentsErrorState extends AppStates {}

class GetLikedLoadingState extends AppStates {}

class GetLikedSuccessState extends AppStates {}

class GetLikedsErrorState extends AppStates {}

class GetCommentSubLoadingState extends AppStates {}

class GetCommentSubSuccessState extends AppStates {}

class GetCommentsSubErrorState extends AppStates {}

class UploadCommentPicLoadingState extends AppStates {}

class UploadCommentPicSuccessState extends AppStates {}

class UploadCommentPicErrorState extends AppStates {}

class UploadCommentPicSubLoadingState extends AppStates {}

class UploadCommentPicSubSuccessState extends AppStates {}

class UploadCommentPicSubErrorState extends AppStates {}

class UpdatePostLoadingState extends AppStates {}

class GetCommentPicSuccessState extends AppStates {}

class GetCommentPicErrorState extends AppStates {}

class GetCommentPicSubSuccessState extends AppStates {}

class GetCommentPicSubErrorState extends AppStates {}

class AppSendMessageSuccessState extends AppStates {}

class AppSendMessageErrorState extends AppStates {}

class AppGetMessageSuccessState extends AppStates {}

class GetMessagePicSuccessState extends AppStates {}

class GetMessagePicErrorState extends AppStates {}

class UploadMessagePicLoadingState extends AppStates {}

class UploadMessagePicSuccessState extends AppStates {}

class UploadMessagePicErrorState extends AppStates {}

class DeleteMessagePicState extends AppStates {}

class DeleteCommentPicState extends AppStates {}

class GetPostLoadingState extends AppStates {}

class GetSinglePostSuccessState extends AppStates {}

class GetPostErrorState extends AppStates {}

class UploadMultiPicLoadingState extends AppStates {}

class UploadMultiPicSuccessState extends AppStates {}

class UploadMultiPicErrorState extends AppStates {}

class DeleteMultiPicState extends AppStates {}

class DeleteAMultiPicSuccessState extends AppStates {}

class DeleteAMultiPicErrorState extends AppStates {}

class DeleteIndexMultiPicSuccessState extends AppStates {}

class DeleteIndexMultiPicErrorState extends AppStates {}

class DeleteAllFilePickerSuccessState extends AppStates {}

class DeleteAllFilePickerErrorState extends AppStates {}

class EditItemTempSuccessState extends AppStates {}

class EditItemTempErrorState extends AppStates {}

class GetEditItemTempSuccessState extends AppStates {}

class GetEditItemTempErrorState extends AppStates {}

class ResetPostSuccessState extends AppStates {}

class ResetPostErrorState extends AppStates {}

class LoadAlbumLoadingState extends AppStates {}

class LoadAlbumErrorState extends AppStates {}

class LoadAlbumSuccessState extends AppStates {}

class LoadAlbumLevel1SuccessState extends AppStates {}

class LoadAlbumLevel1ErrorState extends AppStates {}

class LoadAlbumLevel2SuccessState extends AppStates {}

class LoadAlbumLevel2ErrorState extends AppStates {}

class GetThumbnailPathAlbumSuccessState extends AppStates {}

class CheckFollowerSuccessState extends AppStates {}

class CheckFollowerErrorState extends AppStates {}

class CheckFollowerLoadingState extends AppStates {}

class AddFollowerSuccessState extends AppStates {}

class AddFollowerLoadingState extends AppStates {}

class AddFollowerErrorState extends AppStates {}

class CheckAcceptSuccessState extends AppStates {}

class CheckAcceptErrorState extends AppStates {}

class UnFollowerSuccessState extends AppStates {}

class UnFollowerErrorState extends AppStates {}

class GetFollowerSuccessState extends AppStates {}

class SetShowMoreTagsSuccessState extends AppStates {}

class GetFollowerErroeState extends AppStates {}

class CheckFriendsuccessState extends AppStates {}

class CheckFriendsErrorState extends AppStates {}

class CheckFriendsLoadingState extends AppStates {}

class AddFriendsSuccessState extends AppStates {}

class AddFriendsLoadingState extends AppStates {}

class AddFriendsErrorState extends AppStates {}

class UnFriendsSuccessState extends AppStates {}

class UnBothFriendsSuccessState extends AppStates {}

class UnFriendsErrorState extends AppStates {}

class GetFriendsSuccessState extends AppStates {}

class GetFriendsErroeState extends AppStates {}

class SendNotifiSuccessState extends AppStates {}

class SendNotifiErrorState extends AppStates {}

class GetTagsPostSuccessState extends AppStates {}

class GetTagsPostErrorState extends AppStates {}