@import Foundation;

typedef NS_ENUM(NSUInteger, WPAnalyticsStat) {
    WPAnalyticsStatNoStat, // Since we can't have a nil enum we'll use this to act as the nil
    WPAnalyticsStatABTestStart,
    WPAnalyticsStatAddedSelfHostedSite,
    WPAnalyticsStatAddedSelfHostedSiteButJetpackNotConnectedToWPCom,
    WPAnalyticsStatActivityLogViewed,
    WPAnalyticsStatActivityLogDetailViewed,
    WPAnalyticsStatActivityLogRewindStarted,
    WPAnalyticsStatAppInstalled,
    WPAnalyticsStatAppReviewsCanceledFeedbackScreen,
    WPAnalyticsStatAppReviewsDeclinedToRateApp,
    WPAnalyticsStatAppReviewsDidntLikeApp,
    WPAnalyticsStatAppReviewsLikedApp,
    WPAnalyticsStatAppReviewsOpenedFeedbackScreen,
    WPAnalyticsStatAppReviewsRatedApp,
    WPAnalyticsStatAppReviewsSawPrompt,
    WPAnalyticsStatAppReviewsSentFeedback,
    WPAnalyticsStatAppSettingsImageOptimizationChanged,
    WPAnalyticsStatAppSettingsMediaRemoveLocationChanged,
    WPAnalyticsStatAppSettingsVideoOptimizationChanged,
    WPAnalyticsStatAppSettingsGutenbergEnabled,
    WPAnalyticsStatAppSettingsGutenbergDisabled,
    WPAnalyticsStatAppUpgraded,
    WPAnalyticsStatApplicationClosed,
    WPAnalyticsStatApplicationOpened,
    WPAnalyticsStatAutomatedTransferCustomDomainDialogShown,
    WPAnalyticsStatAutomatedTransferCustomDomainDialogCancelled,
    WPAnalyticsStatAutomatedTransferCustomDomainSuggestionQueried,
    WPAnalyticsStatAutomatedTransferCustomDomainSuggestionSelected,
    WPAnalyticsStatAutomatedTransferCustomDomainContactInfoValidated,
    WPAnalyticsStatAutomatedTransferCustomDomainContactInfoValidationFailed,
    WPAnalyticsStatAutomatedTransferCustomDomainPurchased,
    WPAnalyticsStatAutomatedTransferCustomDomainPurchaseFailed,
    WPAnalyticsStatAutomatedTransferDialogShown,
    WPAnalyticsStatAutomatedTransferDialogCancelled,
    WPAnalyticsStatAutomatedTransferEligibilityCheckInitiated,
    WPAnalyticsStatAutomatedTransferSiteIneligible,
    WPAnalyticsStatAutomatedTransferInitiate,
    WPAnalyticsStatAutomatedTransferInitiated,
    WPAnalyticsStatAutomatedTransferInitiationFailed,
    WPAnalyticsStatAutomatedTransferStatusComplete,
    WPAnalyticsStatAutomatedTransferStatusFailed,
    WPAnalyticsStatAutomatedTransferFlowComplete,
    WPAnalyticsStatCreatedAccount,
    WPAnalyticsStatCreatedSite,
    WPAnalyticsStatCreateAccountInitiated,
    WPAnalyticsStatCreateAccountEmailExists,
    WPAnalyticsStatCreateAccountUsernameExists,
    WPAnalyticsStatCreateAccountFailed,
    WPAnalyticsStatCreateSiteProcessBegun,
    WPAnalyticsStatCreateSiteCategoryViewed,
    WPAnalyticsStatCreateSiteDetailsViewed,
    WPAnalyticsStatCreateSiteDomainViewed,
    WPAnalyticsStatCreateSiteThemeViewed,
    WPAnalyticsStatCreateSiteRequestInitiated,
    WPAnalyticsStatCreateSiteSuccessViewed,
    WPAnalyticsStatCreateSiteCreationFailed,
    WPAnalyticsStatCreateSiteSetTaglineFailed,
    WPAnalyticsStatCreateSiteSetThemeFailed,
    WPAnalyticsStatCreateSiteValidationFailed,
    WPAnalyticsStatDefaultAccountChanged,
    WPAnalyticsStatDeepLinked,
    WPAnalyticsStatDeepLinkFailed,
    WPAnalyticsStatDomainCreditPromptShown,
    WPAnalyticsStatDomainCreditRedemptionSuccess,
    WPAnalyticsStatDomainCreditRedemptionTapped,
    WPAnalyticsStatEditorAddedPhotoViaLocalLibrary,
    WPAnalyticsStatEditorAddedVideoViaLocalLibrary,
    WPAnalyticsStatEditorAddedPhotoViaWPMediaLibrary,
    WPAnalyticsStatEditorAddedVideoViaWPMediaLibrary,
    WPAnalyticsStatEditorAddedOtherMediaViaWPMediaLibrary,
    WPAnalyticsStatEditorAddedPhotoViaGiphy,
    WPAnalyticsStatEditorAddedPhotoViaOtherApps,
    WPAnalyticsStatEditorAddedPhotoViaStockPhotos,
    WPAnalyticsStatEditorAddedVideoViaOtherApps,
    WPAnalyticsStatEditorAztecBetaLink,
    WPAnalyticsStatEditorAztecPromoLink,
    WPAnalyticsStatEditorAztecPromoPositive,
    WPAnalyticsStatEditorAztecPromoNegative,
    WPAnalyticsStatEditorClosed,
    WPAnalyticsStatEditorCreatedPost,
    WPAnalyticsStatEditorDiscardedChanges,
    WPAnalyticsStatEditorEditedImage,
    WPAnalyticsStatEditorEnabledNewVersion,
    WPAnalyticsStatEditorPublishedPost,
    WPAnalyticsStatEditorQuickPublishedPost,
    WPAnalyticsStatEditorQuickSavedDraft,
    WPAnalyticsStatEditorResizedPhoto,
    WPAnalyticsStatEditorResizedPhotoError,
    WPAnalyticsStatEditorSavedDraft,
    WPAnalyticsStatEditorScheduledPost,
    WPAnalyticsStatEditorTappedBlockquote,
    WPAnalyticsStatEditorTappedBold,
    WPAnalyticsStatEditorTappedHeader,
    WPAnalyticsStatEditorTappedHeaderSelection,
    WPAnalyticsStatEditorTappedHorizontalRule,
    WPAnalyticsStatEditorTappedHTML,
    WPAnalyticsStatEditorTappedImage,
    WPAnalyticsStatEditorMediaPickerTappedDismiss,
    WPAnalyticsStatEditorMediaPickerTappedDevicePhotos,
    WPAnalyticsStatEditorMediaPickerTappedCamera,
    WPAnalyticsStatEditorMediaPickerTappedMediaLibrary,
    WPAnalyticsStatEditorMediaPickerTappedOtherApps,
    WPAnalyticsStatEditorSessionStart,
    WPAnalyticsStatEditorSessionSwitchEditor,
    WPAnalyticsStatEditorSessionEnd,
    WPAnalyticsStatEditorTappedItalic,
    WPAnalyticsStatEditorTappedLink,
    WPAnalyticsStatEditorTappedMore,
    WPAnalyticsStatEditorTappedMoreItems,
    WPAnalyticsStatEditorTappedOrderedList,
    WPAnalyticsStatEditorTappedStrikethrough,
    WPAnalyticsStatEditorTappedUnderline,
    WPAnalyticsStatEditorTappedUnlink,
    WPAnalyticsStatEditorTappedUnorderedList,
    WPAnalyticsStatEditorToggledOff,
    WPAnalyticsStatEditorToggledOn,
    WPAnalyticsStatEditorUpdatedPost,
    WPAnalyticsStatEditorUploadMediaFailed,
    WPAnalyticsStatEditorUploadMediaRetried,
    WPAnalyticsStatEnhancedSiteCreationAccessed,
    WPAnalyticsStatEnhancedSiteCreationSegmentsViewed,
    WPAnalyticsStatEnhancedSiteCreationSegmentsSelected,
    WPAnalyticsStatEnhancedSiteCreationVerticalsViewed,
    WPAnalyticsStatEnhancedSiteCreationVerticalsSelected,
    WPAnalyticsStatEnhancedSiteCreationVerticalsSkipped,
    WPAnalyticsStatEnhancedSiteCreationBasicInformationViewed,
    WPAnalyticsStatEnhancedSiteCreationBasicInformationCompleted,
    WPAnalyticsStatEnhancedSiteCreationBasicInformationSkipped,
    WPAnalyticsStatEnhancedSiteCreationDomainsAccessed,
    WPAnalyticsStatEnhancedSiteCreationDomainsSelected,
    WPAnalyticsStatEnhancedSiteCreationSuccessLoading,
    WPAnalyticsStatEnhancedSiteCreationSuccessPreviewViewed,
    WPAnalyticsStatEnhancedSiteCreationSuccessPreviewLoaded,
    WPAnalyticsStatEnhancedSiteCreationSuccessPreviewOkButtonTapped,
    WPAnalyticsStatEnhancedSiteCreationErrorShown,
    WPAnalyticsStatGiphyAccessed,
    WPAnalyticsStatGiphySearched,
    WPAnalyticsStatGiphyUploaded,
    WPAnalyticsStatGravatarCropped,
    WPAnalyticsStatGravatarTapped,
    WPAnalyticsStatGravatarUploaded,
    WPAnalyticsStatGutenbergWarningConfirmDialogShown,
    WPAnalyticsStatGutenbergWarningConfirmDialogYesTapped,
    WPAnalyticsStatGutenbergWarningConfirmDialogCancelTapped,
    WPAnalyticsStatGutenbergWarningConfirmDialogDontShowAgainChecked,
    WPAnalyticsStatGutenbergWarningConfirmDialogDontShowAgainUnchecked,
    WPAnalyticsStatGutenbergWarningConfirmDialogLearnMoreTapped,
    WPAnalyticsStatInstallJetpackCanceled,
    WPAnalyticsStatInstallJetpackCompleted,
    WPAnalyticsStatInstallJetpackRemoteStart,
    WPAnalyticsStatInstallJetpackRemoteCompleted,
    WPAnalyticsStatInstallJetpackRemoteFailed,
    WPAnalyticsStatInstallJetpackRemoteRetry,
    WPAnalyticsStatInstallJetpackRemoteConnect,
    WPAnalyticsStatInstallJetpackRemoteLogin,
    WPAnalyticsStatInstallJetpackRemoteStartManualFlow,
    WPAnalyticsStatInstallJetpackWebviewSelect,
    WPAnalyticsStatInstallJetpackWebviewFailed,
    WPAnalyticsStatLogSpecialCondition,
    WPAnalyticsStatLoginFailed,
    WPAnalyticsStatLoginFailedToGuessXMLRPC,
    WPAnalyticsStatLoginAutoFillCredentialsFilled,
    WPAnalyticsStatLoginAutoFillCredentialsUpdated,
    WPAnalyticsStatLoginEmailFormViewed,
    WPAnalyticsStatLoginEpilogueViewed,
    WPAnalyticsStatLoginForgotPasswordClicked,
    WPAnalyticsStatLoginMagicLinkOpenEmailClientViewed,
    WPAnalyticsStatLoginMagicLinkRequestFormViewed,
    WPAnalyticsStatLoginMagicLinkExited,
    WPAnalyticsStatLoginMagicLinkFailed,
    WPAnalyticsStatLoginMagicLinkOpened,
    WPAnalyticsStatLoginMagicLinkRequested,
    WPAnalyticsStatLoginMagicLinkSucceeded,
    WPAnalyticsStatLoginPasswordFormViewed,
    WPAnalyticsStatLoginProloguePaged,
    WPAnalyticsStatLoginPrologueViewed,
    WPAnalyticsStatLoginTwoFactorFormViewed,
    WPAnalyticsStatLoginURLFormViewed,
    WPAnalyticsStatLoginURLHelpScreenViewed,
    WPAnalyticsStatLoginUsernamePasswordFormViewed,
    WPAnalyticsStatLoginSocialButtonClick,
    WPAnalyticsStatLoginSocialButtonFailure,
    WPAnalyticsStatLoginSocialConnectSuccess,
    WPAnalyticsStatLoginSocialConnectFailure,
    WPAnalyticsStatLoginSocialSuccess,
    WPAnalyticsStatLoginSocialFailure,
    WPAnalyticsStatLoginSocial2faNeeded,
    WPAnalyticsStatLoginSocialAccountsNeedConnecting,
    WPAnalyticsStatLoginSocialErrorUnknownUser,
    WPAnalyticsStatLogout,
    WPAnalyticsStatLowMemoryWarning,
    WPAnalyticsStatMediaLibraryDeletedItems,
    WPAnalyticsStatMediaLibraryEditedItemMetadata,
    WPAnalyticsStatMediaLibraryPreviewedItem,
    WPAnalyticsStatMediaLibrarySharedItemLink,
    WPAnalyticsStatMediaLibraryAddedPhoto,
    WPAnalyticsStatMediaLibraryAddedVideo,
    WPAnalyticsStatMediaLibraryAddedPhotoViaDeviceLibrary,
    WPAnalyticsStatMediaLibraryAddedPhotoViaGiphy,
    WPAnalyticsStatMediaLibraryAddedPhotoViaOtherApps,
    WPAnalyticsStatMediaLibraryAddedPhotoViaStockPhotos,
    WPAnalyticsStatMediaLibraryAddedPhotoViaCamera,
    WPAnalyticsStatMediaLibraryAddedVideoViaDeviceLibrary,
    WPAnalyticsStatMediaLibraryAddedVideoViaCamera,
    WPAnalyticsStatMediaLibraryAddedVideoViaOtherApps,
    WPAnalyticsStatMediaLibraryUploadMediaRetried,
    WPAnalyticsStatMediaServiceUploadStarted,
    WPAnalyticsStatMediaServiceUploadFailed,
    WPAnalyticsStatMediaServiceUploadSuccessful,
    WPAnalyticsStatMediaServiceUploadCanceled,
    WPAnalyticsStatMenusAccessed,
    WPAnalyticsStatMenusCreatedItem,
    WPAnalyticsStatMenusCreatedMenu,
    WPAnalyticsStatMenusDeletedMenu,
    WPAnalyticsStatMenusDeletedItem,
    WPAnalyticsStatMenusDiscardedChanges,
    WPAnalyticsStatMenusEditedItem,
    WPAnalyticsStatMenusOpenedItemEditor,
    WPAnalyticsStatMenusOrderedItems,
    WPAnalyticsStatMenusSavedMenu,
    WPAnalyticsStatMeTabAccessed,
    WPAnalyticsStatMySitesTabAccessed,
    WPAnalyticsStatNewsCardViewed,
    WPAnalyticsStatNewsCardDismissed,
    WPAnalyticsStatNewsCardRequestedExtendedInfo,
    WPAnalyticsStatNotificationsCommentApproved,
    WPAnalyticsStatNotificationsCommentFlaggedAsSpam,
    WPAnalyticsStatNotificationsCommentLiked,
    WPAnalyticsStatNotificationsCommentRepliedTo,
    WPAnalyticsStatNotificationsCommentTrashed,
    WPAnalyticsStatNotificationsCommentUnapproved,
    WPAnalyticsStatNotificationsCommentUnliked,
    WPAnalyticsStatNotificationsMissingSyncWarning,
    WPAnalyticsStatNotificationsTappedNewPost,
    WPAnalyticsStatNotificationsTappedViewReader,
    WPAnalyticsStatNotificationsTappedSegmentedControl,
    WPAnalyticsStatNotificationsSettingsUpdated,
    WPAnalyticsStatNotificationsSettingsBlogNotificationsOn,
    WPAnalyticsStatNotificationsSettingsBlogNotificationsOff,
    WPAnalyticsStatNotificationsSettingsEmailNotificationsOn,
    WPAnalyticsStatNotificationsSettingsEmailNotificationsOff,
    WPAnalyticsStatNotificationsSettingsEmailDeliveryInstantly,
    WPAnalyticsStatNotificationsSettingsEmailDeliveryDaily,
    WPAnalyticsStatNotificationsSettingsEmailDeliveryWeekly,
    WPAnalyticsStatNotificationsSettingsCommentsNotificationsOn,
    WPAnalyticsStatNotificationsSettingsCommentsNotificationsOff,
    WPAnalyticsStatNotificationsSiteFollowAction,
    WPAnalyticsStatNotificationsSiteUnfollowAction,
    WPAnalyticsStatNotificationsUploadMediaSuccessWritePost,
    WPAnalyticsStatNotificationsShareSuccessEditPost,
    WPAnalyticsStatOnePasswordFailed,
    WPAnalyticsStatOnePasswordLogin,
    WPAnalyticsStatOnePasswordSignup,
    WPAnalyticsStatOpenedAccountSettings,
    WPAnalyticsStatOpenedAppSettings,
    WPAnalyticsStatOpenedComments,
    WPAnalyticsStatOpenedLogin,
    WPAnalyticsStatOpenedMediaLibrary,
    WPAnalyticsStatOpenedMyProfile,
    WPAnalyticsStatOpenedNotificationsList,
    WPAnalyticsStatOpenedNotificationDetails,
    WPAnalyticsStatOpenedNotificationSettingsList,
    WPAnalyticsStatOpenedNotificationSettingStreams,
    WPAnalyticsStatOpenedNotificationSettingDetails,
    WPAnalyticsStatOpenedPages,
    WPAnalyticsStatOpenedPlans,
    WPAnalyticsStatOpenedPlansComparison,
    WPAnalyticsStatOpenedPeople,
    WPAnalyticsStatOpenedPerson,
    WPAnalyticsStatOpenedPluginDirectory,
    WPAnalyticsStatOpenedPluginList,
    WPAnalyticsStatOpenedPosts,
    WPAnalyticsStatOpenedSharingManagement,
    WPAnalyticsStatOpenedSiteSettings,
    WPAnalyticsStatOpenedSupport,
    WPAnalyticsStatOpenedViewAdmin,
    WPAnalyticsStatOpenedViewSite,
    WPAnalyticsStatPerformedCoreDataMigrationFixFor45,
    WPAnalyticsStatPersonUpdated,
    WPAnalyticsStatPersonRemoved,
    WPAnalyticsStatPluginUpdated,
    WPAnalyticsStatPluginRemoved,
    WPAnalyticsStatPluginInstalled,
    WPAnalyticsStatPluginActivated,
    WPAnalyticsStatPluginDeactivated,
    WPAnalyticsStatPluginAutoupdateEnabled,
    WPAnalyticsStatPluginAutoupdateDisabled,
    WPAnalyticsStatPluginSearchPerformed,
    WPAnalyticsStatPageSetParentViewed,
    WPAnalyticsStatPageSetParentSearchAccessed,
    WPAnalyticsStatPageSetParentDonePressed,
    WPAnalyticsStatPostEpilogueDisplayed,
    WPAnalyticsStatPostEpilogueEdit,
    WPAnalyticsStatPostEpilogueShare,
    WPAnalyticsStatPostEpilogueView,
    WPAnalyticsStatPostListAuthorFilterChanged,
    WPAnalyticsStatPostListDraftAction,
    WPAnalyticsStatPostListEditAction,
    WPAnalyticsStatPostListExcessiveLoadMoreDetected, // For research into https://github.com/wordpress-mobile/WordPress-iOS/issues/6819
    WPAnalyticsStatPostListLoadedMore,
    WPAnalyticsStatPostListNoResultsButtonPressed,
    WPAnalyticsStatPostListOpenedCellMenu,
    WPAnalyticsStatPostListPublishAction,
    WPAnalyticsStatPostListScheduleAction,
    WPAnalyticsStatPostListPullToRefresh,
    WPAnalyticsStatPostListRestoreAction,
    WPAnalyticsStatPostListSearchOpened,
    WPAnalyticsStatPostListStatsAction,
    WPAnalyticsStatPostListStatusFilterChanged,
    WPAnalyticsStatPostListTrashAction,
    WPAnalyticsStatPostListViewAction,
    WPAnalyticsStatPostRevisionsListViewed,
    WPAnalyticsStatPostRevisionsDetailViewed,
    WPAnalyticsStatPostRevisionsDetailCancelled,
    WPAnalyticsStatPostRevisionsRevisionLoaded,
    WPAnalyticsStatPostRevisionsLoadUndone,
    WPAnalyticsStatPushAuthenticationApproved,
    WPAnalyticsStatPushAuthenticationExpired,
    WPAnalyticsStatPushAuthenticationFailed,
    WPAnalyticsStatPushAuthenticationIgnored,
    WPAnalyticsStatPushNotificationAlertPressed,
    WPAnalyticsStatPushNotificationReceived,
    WPAnalyticsStatPushNotificationQuickActionCompleted,
    WPAnalyticsStatPushNotificationPrimerSeen,
    WPAnalyticsStatPushNotificationPrimerAllowTapped,
    WPAnalyticsStatPushNotificationPrimerNoTapped,
    WPAnalyticsStatPushNotificationWinbackShown,
    WPAnalyticsStatPushNotificationWinbackNoTapped,
    WPAnalyticsStatPushNotificationWinbackSettingsTapped,
    WPAnalyticsStatPushNotificationOSAlertShown,
    WPAnalyticsStatPushNotificationOSAlertAllowed,
    WPAnalyticsStatPushNotificationOSAlertDenied,
    WPAnalyticsStatQuickStartAllToursCompleted,
    WPAnalyticsStatQuickStartChecklistItemTapped,
    WPAnalyticsStatQuickStartChecklistSkippedAll,
    WPAnalyticsStatQuickStartChecklistViewed,
    WPAnalyticsStatQuickStartCongratulationsViewed,
    WPAnalyticsStatQuickStartRequestAlertButtonTapped,
    WPAnalyticsStatQuickStartRequestAlertViewed,
    WPAnalyticsStatQuickStartSuggestionButtonTapped,
    WPAnalyticsStatQuickStartSuggestionViewed,
    WPAnalyticsStatQuickStartTourCompleted,
    WPAnalyticsStatQuickStartMigrationDialogViewed,
    WPAnalyticsStatQuickStartMigrationDialogPositiveTapped,
    WPAnalyticsStatQuickStartRemoveDialogButtonRemoveTapped,
    WPAnalyticsStatQuickStartRemoveDialogButtonCancelTapped,
    WPAnalyticsStatQuickStartTypeDismissed,
    WPAnalyticsStatQuickStartListCollapsed,
    WPAnalyticsStatQuickStartListExpanded,
    WPAnalyticsStatQuickStartListItemSkipped,
    WPAnalyticsStatQuickStartNotificationStarted,
    WPAnalyticsStatQuickStartNotificationTapped,
    WPAnalyticsStatReaderAccessed,
    WPAnalyticsStatReaderArticleCommentedOn,
    WPAnalyticsStatReaderArticleCommentLiked,
    WPAnalyticsStatReaderArticleCommentUnliked,
    WPAnalyticsStatReaderArticleCommentsOpened,
    WPAnalyticsStatReaderArticleLiked,
    WPAnalyticsStatReaderArticleOpened,
    WPAnalyticsStatReaderArticleReblogged,
    WPAnalyticsStatReaderArticleUnliked,
    WPAnalyticsStatReaderArticleDetailLiked,
    WPAnalyticsStatReaderArticleDetailUnliked,
    WPAnalyticsStatReaderDiscoverViewed,
    WPAnalyticsStatReaderFreshlyPressedLoaded,
    WPAnalyticsStatReaderInfiniteScroll,
    WPAnalyticsStatReaderListFollowed,
    WPAnalyticsStatReaderListLoaded,
    WPAnalyticsStatReaderListPreviewed,
    WPAnalyticsStatReaderListUnfollowed,
    WPAnalyticsStatReaderListNotificationMenuOn,
    WPAnalyticsStatReaderListNotificationMenuOff,
    WPAnalyticsStatReaderListNotificationEnabled,
    WPAnalyticsStatReaderPostSaved,
    WPAnalyticsStatReaderPostUnsaved,
    WPAnalyticsStatReaderSavedPostOpened,
    WPAnalyticsStatReaderSavedListViewed,
    WPAnalyticsStatReaderSearchLoaded,
    WPAnalyticsStatReaderSearchPerformed,
    WPAnalyticsStatReaderSearchResultTapped,
    WPAnalyticsStatReaderSiteBlocked,
    WPAnalyticsStatReaderSiteFollowed,
    WPAnalyticsStatReaderSitePreviewed,
    WPAnalyticsStatReaderSiteUnfollowed,
    WPAnalyticsStatReaderSiteShared,
    WPAnalyticsStatReaderTagFollowed,
    WPAnalyticsStatReaderTagLoaded,
    WPAnalyticsStatReaderTagPreviewed,
    WPAnalyticsStatReaderTagUnfollowed,
    WPAnalyticsStatSelectedInstallJetpack,
    WPAnalyticsStatSentItemToGooglePlus,
    WPAnalyticsStatSentItemToInstapaper,
    WPAnalyticsStatSentItemToPocket,
    WPAnalyticsStatSentItemToWordPress,
    WPAnalyticsStatSharedItem,
    WPAnalyticsStatSharedItemViaEmail,
    WPAnalyticsStatSharedItemViaFacebook,
    WPAnalyticsStatSharedItemViaSMS,
    WPAnalyticsStatSharedItemViaTwitter,
    WPAnalyticsStatSharedItemViaWeibo,
    WPAnalyticsStatSharingButtonSettingsChanged,
    WPAnalyticsStatSharingButtonOrderChanged,
    WPAnalyticsStatSharingButtonShowReblogChanged,
    WPAnalyticsStatSharingOpenedPublicize,
    WPAnalyticsStatSharingOpenedSharingButtonSettings,
    WPAnalyticsStatSharingPublicizeConnected,
    WPAnalyticsStatSharingPublicizeDisconnected,
    WPAnalyticsStatSharingPublicizeConnectionAvailableToAllChanged,
    WPAnalyticsStatShortcutLogIn,
    WPAnalyticsStatShortcutNewPost,
    WPAnalyticsStatShortcutNewPhotoPost,
    WPAnalyticsStatShortcutStats,
    WPAnalyticsStatShortcutNotifications,
    WPAnalyticsStatSignedIn,
    WPAnalyticsStatSignedInToJetpack,
    WPAnalyticsStatSignupButtonTapped,
    WPAnalyticsStatSignupCancelled,
    WPAnalyticsStatSignupEmailButtonTapped,
    WPAnalyticsStatSignupEmailToLogin,
    WPAnalyticsStatSignupEpilogueViewed,
    WPAnalyticsStatSignupEpilogueUnchanged,
    WPAnalyticsStatSignupEpilogueDisplayNameUpdateSucceeded,
    WPAnalyticsStatSignupEpilogueDisplayNameUpdateFailed,
    WPAnalyticsStatSignupEpiloguePasswordUpdateSucceeded,
    WPAnalyticsStatSignupEpiloguePasswordUpdateFailed,
    WPAnalyticsStatSignupEpilogueUsernameTapped,
    WPAnalyticsStatSignupEpilogueUsernameSuggestionsFailed,
    WPAnalyticsStatSignupEpilogueUsernameUpdateSucceeded,
    WPAnalyticsStatSignupEpilogueUsernameUpdateFailed,
    WPAnalyticsStatSignupMagicLinkFailed,
    WPAnalyticsStatSignupMagicLinkOpenEmailClientViewed,
    WPAnalyticsStatSignupMagicLinkOpened,
    WPAnalyticsStatSignupMagicLinkSucceeded,
    WPAnalyticsStatSignupSocialSuccess,
    WPAnalyticsStatSignupSocialFailure,
    WPAnalyticsStatSignupSocialButtonFailure,
    WPAnalyticsStatSignupSocialButtonTapped,
    WPAnalyticsStatSignupSocialToLogin,
    WPAnalyticsStatSignupMagicLinkRequested,
    WPAnalyticsStatSignupTermsButtonTapped,
    WPAnalyticsStatSiteSettingsSiteIconTapped,
    WPAnalyticsStatSiteSettingsSiteIconRemoved,
    WPAnalyticsStatSiteSettingsSiteIconShotNew,
    WPAnalyticsStatSiteSettingsSiteIconGalleryPicked,
    WPAnalyticsStatSiteSettingsSiteIconCropped,
    WPAnalyticsStatSiteSettingsSiteIconUploaded,
    WPAnalyticsStatSiteSettingsSiteIconUploadFailed,
    WPAnalyticsStatSiteSettingsDeleteSiteAccessed,
    WPAnalyticsStatSiteSettingsDeleteSitePurchasesRequested,
    WPAnalyticsStatSiteSettingsDeleteSitePurchasesShowClicked,
    WPAnalyticsStatSiteSettingsDeleteSitePurchasesShown,
    WPAnalyticsStatSiteSettingsDeleteSiteRequested,
    WPAnalyticsStatSiteSettingsDeleteSiteResponseError,
    WPAnalyticsStatSiteSettingsDeleteSiteResponseOK,
    WPAnalyticsStatSiteSettingsExportSiteAccessed,
    WPAnalyticsStatSiteSettingsExportSiteRequested,
    WPAnalyticsStatSiteSettingsExportSiteResponseError,
    WPAnalyticsStatSiteSettingsExportSiteResponseOK,
    WPAnalyticsStatSiteSettingsStartOverAccessed,
    WPAnalyticsStatSiteSettingsStartOverContactSupportClicked,
    WPAnalyticsStatSpotlightSearchOpenedPost,
    WPAnalyticsStatSpotlightSearchOpenedPage,
    WPAnalyticsStatSpotlightSearchOpenedReaderPost,
    WPAnalyticsStatSpotlightSearchOpenedApp,
    WPAnalyticsStatSkippedConnectingToJetpack,
    WPAnalyticsStatStatsAccessed,
    WPAnalyticsStatStatsInsightsAccessed,
    WPAnalyticsStatStatsItemTappedAuthors,
    WPAnalyticsStatStatsItemTappedClicks,
    WPAnalyticsStatStatsItemTappedLatestPostSummaryNewPost,
    WPAnalyticsStatStatsItemTappedLatestPostSummarySharePost,
    WPAnalyticsStatStatsItemTappedLatestPostSummaryPost,
    WPAnalyticsStatStatsItemTappedLatestPostSummaryViewPostDetails,
    WPAnalyticsStatStatsItemTappedPostsAndPages,
    WPAnalyticsStatStatsItemTappedSearchTerms,
    WPAnalyticsStatStatsItemTappedTagsAndCategories,
    WPAnalyticsStatStatsItemTappedVideoTapped,
    WPAnalyticsStatStatsOverviewBarChartTapped,
    WPAnalyticsStatStatsOverviewTypeTapped,
    WPAnalyticsStatStatsPeriodDaysAccessed,
    WPAnalyticsStatStatsPeriodWeeksAccessed,
    WPAnalyticsStatStatsPeriodMonthsAccessed,
    WPAnalyticsStatStatsPeriodYearsAccessed,
    WPAnalyticsStatStatsScrolledToBottom,
    WPAnalyticsStatStatsSinglePostAccessed,
    WPAnalyticsStatStatsTappedBarChart,
    WPAnalyticsStatStatsViewAllAccessed,
    WPAnalyticsStatStatsViewMoreTappedAuthors,
    WPAnalyticsStatStatsViewMoreTappedClicks,
    WPAnalyticsStatStatsViewMoreTappedComments,
    WPAnalyticsStatStatsViewMoreTappedCountries,
    WPAnalyticsStatStatsViewMoreTappedFollowers,
    WPAnalyticsStatStatsViewMoreTappedPostsAndPages,
    WPAnalyticsStatStatsViewMoreTappedPublicize,
    WPAnalyticsStatStatsViewMoreTappedReferrers,
    WPAnalyticsStatStatsViewMoreTappedSearchTerms,
    WPAnalyticsStatStatsViewMoreTappedTagsAndCategories,
    WPAnalyticsStatStatsViewMoreTappedVideoPlays,
    WPAnalyticsStatStockMediaAccessed,
    WPAnalyticsStatStockMediaSearched,
    WPAnalyticsStatStockMediaUploaded,
    WPAnalyticsStatSupportReceivedResponseFromSupport,
    WPAnalyticsStatSupportHelpCenterUserSearched,
    WPAnalyticsStatSupportHelpCenterViewed,
    WPAnalyticsStatSupportIdentityFormViewed,
    WPAnalyticsStatSupportIdentitySet,
    WPAnalyticsStatSupportNewRequestViewed,
    WPAnalyticsStatSupportTicketListViewed,
    WPAnalyticsStatSupportNewRequestCreated,
    WPAnalyticsStatSupportNewRequestFailed,
    WPAnalyticsStatSupportNewRequestFileAttached,
    WPAnalyticsStatSupportNewRequestFileAttachmentFailed,
    WPAnalyticsStatSupportTicketUserReplied,
    WPAnalyticsStatSupportTicketUserReplyFailed,
    WPAnalyticsStatSupportTicketListViewFailed,
    WPAnalyticsStatSupportTicketUserViewed,
    WPAnalyticsStatSupportTicketViewFailed,
    WPAnalyticsStatThemesAccessedThemeBrowser,
    WPAnalyticsStatThemesAccessedSearch,
    WPAnalyticsStatThemesChangedTheme,
    WPAnalyticsStatThemesCustomizeAccessed,
    WPAnalyticsStatThemesDemoAccessed,
    WPAnalyticsStatThemesDetailsAccessed,
    WPAnalyticsStatThemesPreviewedSite,
    WPAnalyticsStatThemesSupportAccessed,
    WPAnalyticsStatTrainTracksRender,
    WPAnalyticsStatTrainTracksInteract,
    WPAnalyticsStatTwoFactorCodeRequested,
    WPAnalyticsStatTwoFactorSentSMS,
    WPAnalyticsStatShareExtensionError,
    WPAnalyticsStatSearchAdsAttribution,
    WPAnalyticsStatMaxValue
};

extern NSString *const WPAnalyticsStatEditorPublishedPostPropertyCategory;
extern NSString *const WPAnalyticsStatEditorPublishedPostPropertyPhoto;
extern NSString *const WPAnalyticsStatEditorPublishedPostPropertyTag;
extern NSString *const WPAnalyticsStatEditorPublishedPostPropertyVideo;

@protocol WPAnalyticsTracker;
@interface WPAnalytics : NSObject

+ (void)registerTracker:(id<WPAnalyticsTracker>)tracker;
+ (void)clearTrackers;
+ (void)beginSession;
+ (void)refreshMetadata;
+ (void)beginTimerForStat:(WPAnalyticsStat)stat;
+ (void)endTimerForStat:(WPAnalyticsStat)stat withProperties:(NSDictionary *)properties;
+ (void)track:(WPAnalyticsStat)stat;
+ (void)track:(WPAnalyticsStat)stat withProperties:(NSDictionary *)properties;
+ (void)endSession;
+ (void)clearQueuedEvents;

@end

@protocol WPAnalyticsTracker <NSObject>

- (void)track:(WPAnalyticsStat)stat;
- (void)track:(WPAnalyticsStat)stat withProperties:(NSDictionary *)properties;

@optional
- (void)beginSession;
- (void)endSession;
- (void)refreshMetadata;
- (void)beginTimerForStat:(WPAnalyticsStat)stat;
- (void)endTimerForStat:(WPAnalyticsStat)stat withProperties:(NSDictionary *)properties;
- (void)clearQueuedEvents;

@end
