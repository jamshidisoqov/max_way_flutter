class BaseData {
  PageProps? pageProps;
  bool? bNSSP;

  BaseData({this.pageProps, this.bNSSP});

  BaseData.fromJson(Map<String, dynamic> json) {
    pageProps = json['pageProps'] != null
        ? PageProps.fromJson(json['pageProps'])
        : null;
    bNSSP = json['__N_SSP'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pageProps != null) {
      data['pageProps'] = pageProps!.toJson();
    }
    data['__N_SSP'] = bNSSP;
    return data;
  }
}

class PageProps {
  List<Banners>? banners;
  List<Categories>? categories;
  List<Popups>? popups;
  String? sLang;
  Namespaces? nNamespaces;

  PageProps(
      {this.banners,
        this.categories,
        this.popups,
        this.sLang,
        this.nNamespaces});

  PageProps.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners = <Banners>[];
      json['banners'].forEach((v) {
        banners!.add(Banners.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['popups'] != null) {
      popups = <Popups>[];
      json['popups'].forEach((v) {
        popups!.add(Popups.fromJson(v));
      });
    }
    sLang = json['__lang'];
    nNamespaces = json['__namespaces'] != null
        ? Namespaces.fromJson(json['__namespaces'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (banners != null) {
      data['banners'] = banners!.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (popups != null) {
      data['popups'] = popups!.map((v) => v.toJson()).toList();
    }
    data['__lang'] = sLang;
    if (nNamespaces != null) {
      data['__namespaces'] = nNamespaces!.toJson();
    }
    return data;
  }
}

class Banners {
  String? id;
  Title? title;
  String? position;
  String? image;
  String? url;
  bool? active;
  String? createdAt;
  String? updatedAt;
  String? shipperId;
  String? about;

  Banners(
      {this.id,
        this.title,
        this.position,
        this.image,
        this.url,
        this.active,
        this.createdAt,
        this.updatedAt,
        this.shipperId,
        this.about});

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    position = json['position'];
    image = json['image'];
    url = json['url'];
    active = json['active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    shipperId = json['shipper_id'];
    about = json['about'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (title != null) {
      data['title'] = title!.toJson();
    }
    data['position'] = position;
    data['image'] = image;
    data['url'] = url;
    data['active'] = active;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['shipper_id'] = shipperId;
    data['about'] = about;
    return data;
  }
}

class Title {
  String? uz;
  String? ru;
  String? en;

  Title({this.uz, this.ru, this.en});

  Title.fromJson(Map<String, dynamic> json) {
    uz = json['uz'];
    ru = json['ru'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uz'] = uz;
    data['ru'] = ru;
    data['en'] = en;
    return data;
  }
}

class Categories {
  String? id;
  String? slug;
  String? parentId;
  String? image;
  Title? description;
  Title? title;
  String? orderNo;
  bool? active;
  List<Products>? products;

  Categories(
      {this.id,
        this.slug,
        this.parentId,
        this.image,
        this.description,
        this.title,
        this.orderNo,
        this.active,
        this.products});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    parentId = json['parent_id'];
    image = json['image'];
    description = json['description'] != null
        ? Title.fromJson(json['description'])
        : null;
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    orderNo = json['order_no'];
    active = json['active'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['parent_id'] = parentId;
    data['image'] = image;
    if (description != null) {
      data['description'] = description!.toJson();
    }
    if (title != null) {
      data['title'] = title!.toJson();
    }
    data['order_no'] = orderNo;
    data['active'] = active;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? id;
  int? outPrice;
  String? currency;
  String? string;
  String? type;
  List<String>? categories;
  String? brandId;
  String? rateId;
  String? image;
  bool? activeInMenu;
  bool? hasModifier;
  String? fromTime;
  String? toTime;
  bool? offAlways;
  Title? title;
  Title? description;
  bool? active;
  String? iikoId;
  String? jowiId;

  Products(
      {this.id,
        this.outPrice,
        this.currency,
        this.string,
        this.type,
        this.categories,
        this.brandId,
        this.rateId,
        this.image,
        this.activeInMenu,
        this.hasModifier,
        this.fromTime,
        this.toTime,
        this.offAlways,
        this.title,
        this.description,
        this.active,
        this.iikoId,
        this.jowiId});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    outPrice = json['out_price'];
    currency = json['currency'];
    string = json['string'];
    type = json['type'];
    categories = json['categories'].cast<String>();
    brandId = json['brand_id'];
    rateId = json['rate_id'];
    image = json['image'];
    activeInMenu = json['active_in_menu'];
    hasModifier = json['has_modifier'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
    offAlways = json['off_always'];
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    description = json['description'] != null
        ? Title.fromJson(json['description'])
        : null;
    active = json['active'];
    iikoId = json['iiko_id'];
    jowiId = json['jowi_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['out_price'] = outPrice;
    data['currency'] = currency;
    data['string'] = string;
    data['type'] = type;
    data['categories'] = categories;
    data['brand_id'] = brandId;
    data['rate_id'] = rateId;
    data['image'] = image;
    data['active_in_menu'] = activeInMenu;
    data['has_modifier'] = hasModifier;
    data['from_time'] = fromTime;
    data['to_time'] = toTime;
    data['off_always'] = offAlways;
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (description != null) {
      data['description'] = description!.toJson();
    }
    data['active'] = active;
    data['iiko_id'] = iikoId;
    data['jowi_id'] = jowiId;
    return data;
  }
}

class Popups {
  Title? title;
  Title? about;
  String? image;
  String? fromDate;
  String? toDate;
  String? fromTime;
  String? toTime;
  String? url;
  Title? button;
  bool? active;
  String? shipperId;
  String? id;
  int? orderNo;

  Popups(
      {this.title,
        this.about,
        this.image,
        this.fromDate,
        this.toDate,
        this.fromTime,
        this.toTime,
        this.url,
        this.button,
        this.active,
        this.shipperId,
        this.id,
        this.orderNo});

  Popups.fromJson(Map<String, dynamic> json) {
    title = json['title'] != null ? Title.fromJson(json['title']) : null;
    about = json['about'] != null ? Title.fromJson(json['about']) : null;
    image = json['image'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    fromTime = json['from_time'];
    toTime = json['to_time'];
    url = json['url'];
    button = json['button'] != null ? Title.fromJson(json['button']) : null;
    active = json['active'];
    shipperId = json['shipper_id'];
    id = json['id'];
    orderNo = json['order_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (about != null) {
      data['about'] = about!.toJson();
    }
    data['image'] = image;
    data['from_date'] = fromDate;
    data['to_date'] = toDate;
    data['from_time'] = fromTime;
    data['to_time'] = toTime;
    data['url'] = url;
    if (button != null) {
      data['button'] = button!.toJson();
    }
    data['active'] = active;
    data['shipper_id'] = shipperId;
    data['id'] = id;
    data['order_no'] = orderNo;
    return data;
  }
}

class Namespaces {
  Common? common;

  Namespaces({this.common});

  Namespaces.fromJson(Map<String, dynamic> json) {
    common =
    json['common'] != null ? Common.fromJson(json['common']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (common != null) {
      data['common'] = common!.toJson();
    }
    return data;
  }
}

class Common {
  String? home;
  String? blog;
  String? contacts;
  String? about;
  String? branches;
  String? menu;
  String? add;
  String? cart;
  String? logIn;
  String? signIn;
  String? personalData;
  String? profile;
  String? myOrders;
  String? logOut;
  String? sum;
  String? address;
  String? name;
  String? phoneNumber;
  String? openingHours;
  String? enterADeliveryAddress;
  String? singleCallCenter;
  String? contactText;
  String? allRightsReserved;
  String? signInWithYourPhoneNumber;
  String? sendCode;
  String? confirmationCode;
  String? sendAgain;
  String? confirm;
  String? wrongCodeEntered;
  String? wrongPhoneEntered;
  String? temporarilyUnavailable;
  String? changePhoneNumber;
  String? enterNewNumber;
  String? enterYourName;
  String? dateOfBirth;
  String? toCart;
  String? addToCart;
  String? added;
  String? addedToCart;
  String? orderSuccessText;
  String? goToMyOrders;
  String? successfully;
  String? orderNo;
  String? dateOfRegistration;
  String? change;
  String? save;
  String? myAddress;
  String? addAddress;
  String? addressName;
  String? floor;
  String? accommodation;
  String? building;
  String? apartment;
  String? addressDeleted;
  String? detailsChanged;
  String? nothingChanged;
  String? from;
  String? somethingElse;
  String? select;
  String? please;
  String? delivery;
  String? takeaway;
  String? deliveryAddress;
  String? searchByRestaurantName;
  String? selectTheTypeOfReception;
  String? theRestaurantWillCloseAt;
  String? restaurantWillCloseAt;
  String? restaurantWillOpenAt;
  String? worksAroundTheClock;
  String? toSeeYourCurrentMenu;
  String? takeawayOrder;
  String? or;
  String? cancel;
  String? lastName;
  String? signOut;
  String? changeData;
  String? unknown;
  String? telegramBot;

  Common(
      {this.home,
        this.blog,
        this.contacts,
        this.about,
        this.branches,
        this.menu,
        this.add,
        this.cart,
        this.logIn,
        this.signIn,
        this.personalData,
        this.profile,
        this.myOrders,
        this.logOut,
        this.sum,
        this.address,
        this.name,
        this.phoneNumber,
        this.openingHours,
        this.enterADeliveryAddress,
        this.singleCallCenter,
        this.contactText,
        this.allRightsReserved,
        this.signInWithYourPhoneNumber,
        this.sendCode,
        this.confirmationCode,
        this.sendAgain,
        this.confirm,
        this.wrongCodeEntered,
        this.wrongPhoneEntered,
        this.temporarilyUnavailable,
        this.changePhoneNumber,
        this.enterNewNumber,
        this.enterYourName,
        this.dateOfBirth,
        this.toCart,
        this.addToCart,
        this.added,
        this.addedToCart,
        this.orderSuccessText,
        this.goToMyOrders,
        this.successfully,
        this.orderNo,
        this.dateOfRegistration,
        this.change,
        this.save,
        this.myAddress,
        this.addAddress,
        this.addressName,
        this.floor,
        this.accommodation,
        this.building,
        this.apartment,
        this.addressDeleted,
        this.detailsChanged,
        this.nothingChanged,
        this.from,
        this.somethingElse,
        this.select,
        this.please,
        this.delivery,
        this.takeaway,
        this.deliveryAddress,
        this.searchByRestaurantName,
        this.selectTheTypeOfReception,
        this.theRestaurantWillCloseAt,
        this.restaurantWillCloseAt,
        this.restaurantWillOpenAt,
        this.worksAroundTheClock,
        this.toSeeYourCurrentMenu,
        this.takeawayOrder,
        this.or,
        this.cancel,
        this.lastName,
        this.signOut,
        this.changeData,
        this.unknown,
        this.telegramBot});

  Common.fromJson(Map<String, dynamic> json) {
    home = json['home'];
    blog = json['blog'];
    contacts = json['contacts'];
    about = json['about'];
    branches = json['branches'];
    menu = json['menu'];
    add = json['add'];
    cart = json['cart'];
    logIn = json['log_in'];
    signIn = json['sign_in'];
    personalData = json['personal_data'];
    profile = json['profile'];
    myOrders = json['my_orders'];
    logOut = json['log_out'];
    sum = json['sum'];
    address = json['address'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    openingHours = json['opening_hours'];
    enterADeliveryAddress = json['enter_a_delivery_address'];
    singleCallCenter = json['single_call_center'];
    contactText = json['contact_text'];
    allRightsReserved = json['all_rights_reserved'];
    signInWithYourPhoneNumber = json['sign_in_with_your_phone_number'];
    sendCode = json['send_code'];
    confirmationCode = json['confirmation_code'];
    sendAgain = json['send_again'];
    confirm = json['confirm'];
    wrongCodeEntered = json['wrong_code_entered'];
    wrongPhoneEntered = json['wrong_phone_entered'];
    temporarilyUnavailable = json['temporarily_unavailable'];
    changePhoneNumber = json['change_phone_number'];
    enterNewNumber = json['enter_new_number'];
    enterYourName = json['enter_your_name'];
    dateOfBirth = json['date_of_birth'];
    toCart = json['to_cart'];
    addToCart = json['add_to_cart'];
    added = json['added'];
    addedToCart = json['added_to_cart'];
    orderSuccessText = json['order_success-text'];
    goToMyOrders = json['go_to_my_orders'];
    successfully = json['successfully'];
    orderNo = json['order_no'];
    dateOfRegistration = json['date_of_registration'];
    change = json['change'];
    save = json['save'];
    myAddress = json['my_address'];
    addAddress = json['add_address'];
    addressName = json['address_name'];
    floor = json['floor'];
    accommodation = json['accommodation'];
    building = json['building'];
    apartment = json['apartment'];
    addressDeleted = json['address_deleted'];
    detailsChanged = json['details_changed'];
    nothingChanged = json['nothing_changed'];
    from = json['from'];
    somethingElse = json['something_else?'];
    select = json['select'];
    please = json['please'];
    delivery = json['delivery'];
    takeaway = json['takeaway'];
    deliveryAddress = json['delivery_address'];
    searchByRestaurantName = json['search_by_restaurant_name'];
    selectTheTypeOfReception = json['select_the_type_of_reception'];
    theRestaurantWillCloseAt = json['The_restaurant_will_close_at'];
    restaurantWillCloseAt = json['restaurant_will_close_at'];
    restaurantWillOpenAt = json['restaurant_will_open_at'];
    worksAroundTheClock = json['works_around_the_clock'];
    toSeeYourCurrentMenu = json['to_see_your_current_menu'];
    takeawayOrder = json['takeaway_order'];
    or = json['or'];
    cancel = json['cancel'];
    lastName = json['last_name'];
    signOut = json['sign_out'];
    changeData = json['change_data'];
    unknown = json['unknown'];
    telegramBot = json['telegram_bot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['home'] = home;
    data['blog'] = blog;
    data['contacts'] = contacts;
    data['about'] = about;
    data['branches'] = branches;
    data['menu'] = menu;
    data['add'] = add;
    data['cart'] = cart;
    data['log_in'] = logIn;
    data['sign_in'] = signIn;
    data['personal_data'] = personalData;
    data['profile'] = profile;
    data['my_orders'] = myOrders;
    data['log_out'] = logOut;
    data['sum'] = sum;
    data['address'] = address;
    data['name'] = name;
    data['phone_number'] = phoneNumber;
    data['opening_hours'] = openingHours;
    data['enter_a_delivery_address'] = enterADeliveryAddress;
    data['single_call_center'] = singleCallCenter;
    data['contact_text'] = contactText;
    data['all_rights_reserved'] = allRightsReserved;
    data['sign_in_with_your_phone_number'] = signInWithYourPhoneNumber;
    data['send_code'] = sendCode;
    data['confirmation_code'] = confirmationCode;
    data['send_again'] = sendAgain;
    data['confirm'] = confirm;
    data['wrong_code_entered'] = wrongCodeEntered;
    data['wrong_phone_entered'] = wrongPhoneEntered;
    data['temporarily_unavailable'] = temporarilyUnavailable;
    data['change_phone_number'] = changePhoneNumber;
    data['enter_new_number'] = enterNewNumber;
    data['enter_your_name'] = enterYourName;
    data['date_of_birth'] = dateOfBirth;
    data['to_cart'] = toCart;
    data['add_to_cart'] = addToCart;
    data['added'] = added;
    data['added_to_cart'] = addedToCart;
    data['order_success-text'] = orderSuccessText;
    data['go_to_my_orders'] = goToMyOrders;
    data['successfully'] = successfully;
    data['order_no'] = orderNo;
    data['date_of_registration'] = dateOfRegistration;
    data['change'] = change;
    data['save'] = save;
    data['my_address'] = myAddress;
    data['add_address'] = addAddress;
    data['address_name'] = addressName;
    data['floor'] = floor;
    data['accommodation'] = accommodation;
    data['building'] = building;
    data['apartment'] = apartment;
    data['address_deleted'] = addressDeleted;
    data['details_changed'] = detailsChanged;
    data['nothing_changed'] = nothingChanged;
    data['from'] = from;
    data['something_else?'] = somethingElse;
    data['select'] = select;
    data['please'] = please;
    data['delivery'] = delivery;
    data['takeaway'] = takeaway;
    data['delivery_address'] = deliveryAddress;
    data['search_by_restaurant_name'] = searchByRestaurantName;
    data['select_the_type_of_reception'] = selectTheTypeOfReception;
    data['The_restaurant_will_close_at'] = theRestaurantWillCloseAt;
    data['restaurant_will_close_at'] = restaurantWillCloseAt;
    data['restaurant_will_open_at'] = restaurantWillOpenAt;
    data['works_around_the_clock'] = worksAroundTheClock;
    data['to_see_your_current_menu'] = toSeeYourCurrentMenu;
    data['takeaway_order'] = takeawayOrder;
    data['or'] = or;
    data['cancel'] = cancel;
    data['last_name'] = lastName;
    data['sign_out'] = signOut;
    data['change_data'] = changeData;
    data['unknown'] = unknown;
    data['telegram_bot'] = telegramBot;
    return data;
  }
}