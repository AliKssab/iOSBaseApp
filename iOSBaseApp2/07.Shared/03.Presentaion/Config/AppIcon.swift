//
//  AppIcon.swift
//  AseerAlKotobSwiftUI
//
//  Created by k41ed on 17/06/2025.
//

import SwiftUI

enum AppIcon {
    case system(System)
    case shared(Shared)
    case header(Header)
    case splash(Splash)
    case startupFlow(StartupFlow)
    case auth(Auth)
    case tabbar(TabBar)
    case home(Home)
    case doctorDetails(DoctorDetails)
    case booking(Booking)
    case search(Search)
    case profile(Profile)
    case inputField(InputField)
    case notification(Notification)
    case alert(Alert)
    case button(Button)
    case validation(Validation)
    case favorite(Favorite)
    case offers(Offers)
    case setting(Setting)
    case myplan(MyPlan)
    case bookDetails(BookDetails)
    case myCart(MyCart)
    case bookPublisher(BookPublisher)
    case libraryBook(BookLibrary)
    case paperBook(PaperBook)
    case myRequest(MyRequest)
    //    case myCart(MyCart)
    case guestMode(GuestMode)
    case subscriberMode(SubscriberMode)
    case userProfile(UserProfile)
    case onbording(Onbording)
    case orderDetails(OrderDetails)
    case faq(FAQ)
    case walet(Walet)
    enum System: String {
        case eyes = "eyes"
    }

    enum Splash: String {
        case logo = "logo_ic"
    }
    
    enum Onbording:String {
        case backButton = "back_btn"
        case onbordingbBackgrond1 =  "onbording_1backgrond_image"
    }
    enum Shared: String {
        case starFill = "ic_star_fill"
        case starEmpty = "ic_star"
        case emptyIcone = "ic_empty"
        case send = "ic_send"
        case confirmationCheckmark = "img_confirmation_prompt"
        case deleteAccount = "img_delete_user"
        case logout = "img_logout"
        case authFirstPlaceholder = "img_medicine"
        case noInternet = "img_no_internet"
        case errorOccured = "img_error"
        case refresh = "ic_refresh"
    }
    
    enum Header: String {
        case backButton = "ic_back_btn"
        case favFilled = "ic_header_fav_filled"
        case arrowBack = "ic_arrow_left"
        case whiteArrow = "ic_whiteArrow"
        case shareIcon = "ic_share"
        case favouriteIcon = "ic_whiteHeart"
        case whiteArrowBack = "ic_header_arrow_back_white"
        case share = "ic_header_share"
        case backgroundPattern = "bg_header_pattern"
        case filterIcon = "ic_filter"
        case sortBlack  = "ic_sort_black"
        case redHeart = "ic_redheart"
        case dots = "ic_dot-horizontal_userProfile"
        case chat = "chat_icon"
    }
 
    enum StartupFlow: String {
        case book1 = "img_intro_onboarding1"
        case btnGround = "img_intro_onboarding_btn"
        case book2 = "img_intro_onboarding2"
        case book3 = "img_intro_onboarding3"
    }
    
    enum Auth: String {
        case headerColoredLogo = "ic_auth_header_logo"
        case headerPattern = "bg_auth_header_pattern"
        case guestEyes = "ic_auth_guest_eyes"
        case guest = "ic_guest"
        case faceBock = "ic_auth_faceBook"
        case google = "ic_auth_google"
        case twitter = "ic_auth_twitter"
        case backgroundStar = "ic_auth_background_star"
        case welcome = "ic_auth_login_welcome"
        case skip = "ic_auth_skip"
        case successPasswoerd  = "ic_auth_success_passwoerd"
        case countryFlag = "ic_auth_country_flag"
        case circleFill = "ic_Circle_Fill"
        case circleEmpty = "ic_Circle_Empty"
        case add = "img_add"
        case minus = "img_minus"
        case arrowBack = "arrow-right"
        case skipArrow = "img_skip"
        case planeIcon = "im_plane"
        case flag = "flag_icone"
        
    }
    
    enum TabBar: String {
        case activeDot = "ic_tab_green_dot"
        case home = "ic_tab_home"
        case homeFocus = "ic_tab_home_fill"
        case books = "ic_tab_order"
        case booksFocus = "ic_tab_order_fill"
        case libraryFocus = "ic_tab_wallet_fill"
        case library  = "ic_tab_wallet"
        
        case search = "ic_tab_search"
        case searchFocus = "ic_tab_search_fill"
        case reservation = "ic_tab_reservation"
        case reservationFocus = "ic_tab_reservation_fill"
        case favorite = "ic_tab_favorite"
        case favoriteFocus = "ic_tab_favorite_fill"
        case profile = "ic_tab_account"
        case profileFocus = "ic_tab_account_fill"
    }
    
    enum InputField: String {
        case email = "ic_field_email"
        case phone = "ic_field_phone"
        case name = "ic_field_name"
        case showPassword = "ic_field_eye"
        case hidePassword = "ic_field_eye_slash"
    }
    
    enum Alert: String {
        case warning = "ic_alert_warning"
    }
    
    enum Validation: String {
        case errDanger = "ic_err_danger"
    }
    
    enum Button: String {
        case notification = "ic-notification"
        case filter = "ic-filter"
        case starFillWhite = "ic_star_fill_white"
        case starWhite = "ic_star_white"
    }
    
    enum Home: String {
        case guestAvatar = "img_avatar_doctor"
        case purpleDoubleArrow = "ic_go_auth"
        case discount = "img_discount_sticker"
        case profileImg = "img_user_default"
        case arrowLeft = "ic_arrow_left_purble"
        case arrowRight = "ic_arrow_right"
        case medicalSymbol = "ic_medical_symbol"
        case favoriteEmpty = "ic_heart"
        case emptyHeartBlackBorder = "ic_heart_black_border"
        case favoriteFill = "ic_heart_fill"
        case favorite = "ic_favorite"
        case favoriteFocus = "ic_favorite_focus"
        case search = "ic_tab_search"
        case leftArrow =   "ic-arrow-up"
        case banner = "banner1"
        case banner1 = "img-offer2"
        case banner2 = "img-offer3"
        case banner3 = "img-offer4"
        
        case offerCategory = "ic_offer"
        case category2 = "ic_cat1"
        case category3 = "ic_cat2"
        case category4 = "ic_cat3"
        case category5 = "ic_cat4"
        case category6 = "ic_cat5"
        case category7 = "ic_cat6"
        case category8 = "ic_cat7"
        case fireTitleCategory = "ic_title_category_fire"
        case headPhone = "headphone"
        case soundView = "ic_soundView"
        case likeSymbol = "like_img"
        case shareSymbol = "share_img"
        case flagSymbol = "flag_img"
        case writerimg = "writer_img"
        case addimg = "add_img"
        case bookimg = "book_img"
        case heart = "heart_img"
        case bookfillimg = "bookFill_img"
        case browsImage1 = "left_ImageB"
        case browsImage2 = "right_NotoomImgB"
        case browsImage3 = "right_TopImgB"
        case fillImage = "img_like"
        case sideImage = "side_Image"
        case homeNotification = "ic_notification_home"
        case bagHome = "ic_bag_home"
        case backButton = "back_icon"
        case empatyPrders = "emaoty_orders"
    }
    
    enum DoctorDetails: String {
        case timer = "ic_timer"
        case credit = "ic_card"
        case badge = "ic_medal"
        case close = "ic_close_circle"
        case previous = "ic_previous"
        case next = "ic_next"
        case download = "ic_download"
        case pdf = "ic_pdf"
        case notime = "img_no_time"
        case noReview = "img_no_review"
        case docorOut = "ic_out_banner"
    }
    
    enum BookPublisher :String{
        case copyBtn = "ic_copyBtn"
        case wemptyHeartBorders = "ic_borderHeart"
        
    }
    enum Booking: String {
        case date = "ic_calendar"
        case time = "ic_timer"
        case info = "ic_info"
        case credit = "ic_card"
        case success = "ic_success"
        case offer = "ic_discount"
        case sortType = "ic_sort_type"
        case sortDate = "ic_sort_calendar"
    }
    
    enum Search: String {
        case filter = "ic_filter"
        case sort = "ic_sort"
        case arrowLeft =  "ic_arrow_forward"
        case filterSpecialty = "ic_filter_specialty"
        case search = "ic_search"
        case noSearch = "img_no_search"
        case scan = "img_scan"
        case arrowBack = "arrow-right"
        case emptyimg = "img_emptyView"
        case readSearch = "Ic_redSearch"
        case cameraRotation = "ic_cameraRotation"
        case flash = "ic_flash"
    }
    enum Offers: String {
        case calendar = "ic_tinted_calendar"
        case ticketStar = "ic_ticket-star"
        case noOffers = "img_no_offer"
        case discountBadge = "img_paint_badge"
        case tabby = "ic_tabby"
        case mada = "ic_mada"
        case tamara = "ic_tamara"
        case creditCard = "ic_credit_card"
        case applePay = "ic_apple_pay"
        case info = "ic_info_circle"
        case noReservation = "img_no_reservation_yet"
        case pharmcy = "ic_pharmacy"
    }
    
    enum Favorite: String {
        case emptyFav = "img_empty_fav"
    }
    
    enum Profile: String {
        case goArrow = "ic_gray_go_arrow"
        case contactUsCall = "ic_contact_us_wiet"
        case logo = "img_logo"
        case faceBook = "ic_facebook"
        case instagram = "ic_instagram"
        case twitter = "ic_twitter"
        case youtube = "ic_youtube"
        case whatsapp = "ic_whatsapp"
        case email = "ic_gmail"
        case phone = "ic_phone"
        case share = "ic_share"
        case purpleBackgroundImg = "purple_bg_img"
        case guestBackgroundImg = "guest_bg_img"
        case guestProfileImgBg = "bg_image_guest"
        case backgroundPattern = "bg_profile"
        case colorFilter = "ic_color_filter"
        case password = "ic_password__gray"
        case offer = "ic_offer_gray"
        case report = "ic_report_gray"
        case notifictain = "ic_notification_gray"
        case language = "ic_language_gray"
        case contactUs = "ic_contact_us_gray"
        case rateUs = "ic_rate_gray"
        case aboutUs = "ic_about_us_gray"
        case aboutApp = "ic_about_app_gray"
        case emptyFollower = "ic_empty_follower"
        case logout = "ic_logout_gray"
        case goToArrow = "ic_arrow_gray"
        case close = "ic_close_circle"
        case noMedicalReport = "img_no_medical_report"
        case whatsappContact = "ic_contact_us_whatsapp"
        case validationIcon = "ic_deviceManagement"
        case logOut = "ic_logOut"
        case editIcon = "ic_edit"
        case myPlan = "ic_plan"
        case notificationEmpty = "notification_empty"
        case chart = "ic_chart"
        case shoppingCart = "ic_shopping_cart_profile"
        case userfollowing = "ic_user_following"
        case recomended = "ic_recomended"
        case qoutes = "ic_qoutes"
        case review = "ic_review"
        case rating = "ic_rating"
        case location = "ic_location_profile"
        case subscribe = "ic_subscribing"
        case monitorControl = "ic_monitor_control"
        case notificationBtn = "ic_setting"
        case subscribed = "ic_subscribed"
        case emptyViewimg = "bg_emtyview"
        case emptyFavouriteView = "img_flag"
        case disLike = "ic_dislike"
        case disLikeEmpty = "ic_dislike_empty"
        case sheetdeletimg = "img_deletesheet"
        case iconClose = "ic_close"
        case star = "ic_stars"
        case recommendation = "img_recommendation"
        case imageqoutes = "img_qoutes"
        case revisonimg = "img_revision"
        case ratingImage = "img_sale"
        case globalLocation = "img_globallocation"
        case whitelocation = "img_locationwhite"
        case updateProfile = "ic_update_profile"
        case instagramIcone = "instagram"
        case whatsappIcone = "whatsapp"
        case facebookIcone = "facebook"
        case telegramIcone = "telegram"
        case snapchat = "snapchat"
        case tikTok = "tikTok"
        case youtube1 = "youtube"
        case twitter1 = "twitter"
        
        case mail = "Mail"
        case emptyImage = "emptyImage"
        case medal = "medal"

    }
    enum Setting : String {
        case key = "ic_key"
        case profileCircle = "ic_profile_circle"
        case profileDelete = "ic_profile_delete"
        case warrningIcon = "ic_warrinig"
    }
    
    enum MyPlan :String{
        case optionFilter = "ic_option"
    }
    
    enum BookDetails:String{
        case paperBook = "ic_paperBook"
        case icsend = "ic_send-2"
        case emptyratingImg = "ic_bookRatingEmptyimg"
    }
    enum GuestMode : String{
        case homeGuest = "home_visitor_ic"
        case guestSheet = "guest_sheet_ic"
    }
    enum SubscriberMode : String{
        case backgron = "subscriber_backgron"
        case man = "subscriber_man_image"
        case pro = "subscribe_pro"
    }
    
    enum BookLibrary : String{
        case dotsImg = "ic_dots_library"
    }
    
    var iconName: String {
        switch self {
        case .system(let value): return value.rawValue
        case .header(let value): return value.rawValue
        case .splash(let value): return value.rawValue
        case .shared(let value): return value.rawValue
        case .startupFlow(let value): return value.rawValue
        case .auth(let value): return value.rawValue
        case .tabbar(let value): return value.rawValue
        case .home(let value): return value.rawValue
        case .search(let value): return value.rawValue
        case .profile(let value): return value.rawValue
        case .inputField(let value): return value.rawValue
        case .alert(let value): return value.rawValue
        case .notification(let value): return value.rawValue
        case .button(let value): return value.rawValue
        case .validation(let value): return value.rawValue
        case .doctorDetails(let value): return value.rawValue
        case .booking(let value): return value.rawValue
        case .offers(let value): return value.rawValue
        case .favorite(let value): return value.rawValue
        case .setting(let value): return value.rawValue
        case .myplan(let valuw): return valuw.rawValue
        case .bookDetails(let value): return value.rawValue
        case .paperBook(let valuw) : return valuw.rawValue
        case .myCart(let valuw) : return valuw.rawValue
        case .bookPublisher(let valuw) : return valuw.rawValue
        case .guestMode(let value): return value.rawValue
        case .libraryBook(let value): return value.rawValue
        case .myRequest(let value): return value.rawValue
        case .subscriberMode(let value): return value.rawValue
        case .userProfile(let value): return value.rawValue
        case .onbording(let value): return value.rawValue
        case .orderDetails(let value): return value.rawValue
        case .faq(let value): return value.rawValue
        case .walet(let value): return value.rawValue
        }
    }
    
    enum Notification: String {
        case notificationCell = "ic_notification_cell"
        case notificationWarningIcon = "ic_notification_bing"
        case notificationEmpty = "ic_notification_empty"
    }
    
    enum PaperBook : String{
        case seachIcon = "paperBook_search_Icon"
        case fillCkeckBox = "checkBox_fill"
        case emptyCheckBox = "checkBox_empty"
        case shoppingIcon = "ic_shopping"
        case filtter = "ic_filtter"
        case shoppingCart = "ic_shopping_cart"
        case arrowUpFiltter = "ic_auth_arrow_up_fillter"
        case arrowDownFiltter = "ic_auth_arrow_down_fillter"
    }
    
    enum MyCart : String{
        case emptyIcon = "ic_myCart_empty"
        case shoppingCartIcon = "ic_shopping_cart"
        case locationIcon = "ic_location"
        case redArrow = "ic_red_arrowDown"
        case trash = "ic_trash_myCart"
        case plus = "ic_plus"
        case minus = "ic_minus"
        case discount = "ic_discount_code"
        case exite = "ic_exite"
        case infoIcon = "ic_info_circle"
        case redLocation = "ic_location_red"
        case cycle = "ic_cycle"
        case visa = "ic_visa"
        case visaCircle = "ic_visa_circle"
        case money = "ic_money"
        case done = "ic_right_done"
    }
    
    enum MyRequest:String{
        case arrowDown = "ic_arrow-down_Myrequest"
        case arrowUp = "ic_arrow-up_Myrequest"
        case chevronRight = "ic_arrow-right_Myrequest"
    }
    
    enum UserProfile:String{
        case emptyRecommendation = "img_emptyRecommendation"
        case emptyBooks = "img_emptyBook_userProfile"
        case emptyQuotes  = "img_quotes_userProfile"
        case emptyRevsion = "img_revision_userProfile"
        case emptyfollower = "img_followe_userProfile"
    }
    enum OrderDetails: String{
        case selectedFill = "ic_selected_fill"
        case seledtedEmpty = "ic_selected_empty"
        case visa = "ic_visa"
        case masterCard = "ic_masterCard"
        case applePay = "ic_apple_pay"
    }
    enum FAQ : String{
        case arrowUp = "ic_arrowUp"
        case arrowDown = "ic_arrowDown"
    }
    enum Walet: String {
        case infoImage = "image_waletBackGround"
        case logo = "specker_logo"
        case rival = "ic_rival"
        case add = "ic_add"
    }
    var isSystemImage: Bool {
        switch self {
        case .system: return true
        default: return false
        }
    }
}
    
    
    extension Image {
      init(_ icon: AppIcon) {
        if icon.isSystemImage {
          self.init(systemName: icon.iconName)
        } else {
          self.init(icon.iconName)
        }
      }
    }
