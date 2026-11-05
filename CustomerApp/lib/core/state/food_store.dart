import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../widgets/app_artwork.dart';

class FoodDish {
  const FoodDish(this.id, this.name, this.description, this.price, this.image, this.category, {this.fasting = false, this.halal = true});
  final String id, name, description, image, category;
  final int price;
  final bool fasting, halal;
}
class FoodRestaurant {
  const FoodRestaurant(this.id, this.name, this.area, this.image, this.minutes, this.fee, this.rating, this.dishes);
  final String id, name, area, image;
  final int minutes, fee;
  final double rating;
  final List<FoodDish> dishes;
}
const foodRestaurants = [
  FoodRestaurant('kategna', 'Kategna Restaurant', 'Bole Atlas', AppArtwork.habesha, 30, 59, 4.8, [
    FoodDish('beyaynetu', 'Beyaynetu', 'A colorful selection of lentils, vegetables and shiro served on fresh injera.', 280, AppArtwork.habesha, 'Habesha', fasting: true),
    FoodDish('tibs', 'Special tibs', 'Tender beef, rosemary, onions and peppers, with injera on the side.', 420, AppArtwork.habesha, 'Habesha'),
    FoodDish('shiro', 'Shiro', 'Slow-cooked chickpea stew with Ethiopian spices and fresh injera.', 190, AppArtwork.habesha, 'Habesha', fasting: true),
  ]),
  FoodRestaurant('savor', 'Savor Addis', 'Bole Rwanda', AppArtwork.pizza, 35, 65, 4.7, [
    FoodDish('margherita', 'Margherita pizza', 'Stone-baked dough, tomato, mozzarella and fresh basil.', 390, AppArtwork.pizza, 'Pizza'),
    FoodDish('veggie', 'Garden pizza', 'Roasted peppers, mushrooms, tomato and olives. Made without cheese.', 360, AppArtwork.pizza, 'Pizza', fasting: true),
    FoodDish('chicken', 'Chicken pizza', 'Grilled chicken, mozzarella, sweet peppers and our house sauce.', 480, AppArtwork.pizza, 'Pizza'),
  ]),
  FoodRestaurant('tomoca', 'Tomoca Coffee', 'Sarbet', AppArtwork.coffee, 20, 45, 4.9, [
    FoodDish('macchiato', 'Macchiato', 'Rich Ethiopian espresso finished with silky steamed milk.', 90, AppArtwork.coffee, 'Coffee'),
    FoodDish('coffee', 'Ethiopian coffee', 'Freshly roasted beans brewed black. A little moment of Addis.', 70, AppArtwork.coffee, 'Coffee', fasting: true),
    FoodDish('breakfast', 'Breakfast & coffee', 'A freshly baked pastry with your favorite macchiato.', 240, AppArtwork.coffee, 'Breakfast'),
  ]),
  FoodRestaurant('addis', 'Addis Kitchen', 'Kazanchis', AppArtwork.habesha, 25, 55, 4.6, [
    FoodDish('doro', 'Doro wat', 'Slow-simmered chicken stew with a boiled egg and soft injera.', 460, AppArtwork.habesha, 'Habesha'),
    FoodDish('fasting', 'Fasting platter', 'Seasonal vegetables, lentils and chickpeas to share.', 320, AppArtwork.habesha, 'Habesha', fasting: true),
  ]),
];
FoodRestaurant restaurantById(String id) => foodRestaurants.firstWhere((r) => r.id == id);
FoodDish dishById(String id) => foodRestaurants.expand((r) => r.dishes).firstWhere((d) => d.id == id);
class FoodLine {
  FoodLine(this.dishId, this.quantity, this.note);
  final String dishId, note;
  int quantity;
  int get total => dishById(dishId).price * quantity;
  Map<String, dynamic> toJson() => {'dish': dishId, 'qty': quantity, 'note': note};
  factory FoodLine.fromJson(Map<String,dynamic> j) {
    dishById(j['dish'] as String);
    final qty = j['qty'] as int;
    if (qty < 1 || qty > 99) throw const FormatException('Invalid quantity');
    return FoodLine(j['dish'] as String, qty, j['note'] as String? ?? '');
  }
}
class FoodOrder {
  FoodOrder({required this.id, required this.restaurantId, required this.lines, required this.address, required this.method, required this.subtotal, required this.discount, required this.serviceFee, required this.deliveryFee, required this.date, this.stage = 0, this.rating = 0, this.restaurantNote = '', this.courierNote = '', this.phone = '', this.callOnArrival = false});
  final String id, restaurantId, address, method, date, restaurantNote, courierNote, phone;
  final bool callOnArrival;
  final List<FoodLine> lines;
  final int subtotal, discount, serviceFee, deliveryFee;
  int stage, rating;
  static const stages = ['Order placed', 'Restaurant accepted', 'Preparing your food', 'Courier on the way', 'Delivered', 'Cancelled'];
  String get status => stages[stage];
  int get total => subtotal - discount + serviceFee + deliveryFee;
  bool get active => stage < 4;
  String get otp => id.substring(id.length - 4);
  Map<String,dynamic> toJson() => {'id': id,'restaurant': restaurantId,'lines': lines.map((l)=>l.toJson()).toList(),'address':address,'method':method,'subtotal':subtotal,'discount':discount,'service':serviceFee,'delivery':deliveryFee,'date':date,'stage':stage,'rating':rating,'restaurantNote':restaurantNote,'courierNote':courierNote,'phone':phone,'call':callOnArrival};
  factory FoodOrder.fromJson(Map<String,dynamic> j) => FoodOrder(id:j['id'],restaurantId:j['restaurant'],lines:(j['lines'] as List).map((l)=>FoodLine.fromJson(Map<String,dynamic>.from(l))).toList(),address:j['address'],method:j['method'],subtotal:j['subtotal'],discount:j['discount'],serviceFee:j['service'],deliveryFee:j['delivery'],date:j['date'],stage:j['stage'],rating:j['rating']??0,restaurantNote:j['restaurantNote']??'',courierNote:j['courierNote']??'',phone:j['phone']??'',callOnArrival:j['call']==true);
}
class FoodStore extends ChangeNotifier {
  static final instance = FoodStore();
  static const storageKey = 'zemengo.food.demo.v1';
  SharedPreferences? _prefs;
  Future<void>? _initializing;
  Future<void> _writes = Future.value();
  final favorites = <String>{}, favoriteDishes = <String>{};
  final List<FoodLine> cart = [];
  final List<FoodOrder> orders = [];
  String? restaurantId;
  String address = 'Bole Bulbula, Addis Ababa', addressNote = '', preference = 'All food', coupon = '';
  String? storageError;
  Future<void> initialize() => _initializing ??= _load();
  Future<void> _load() async {
    _prefs = await SharedPreferences.getInstance();
    try {
      final raw = _prefs!.getString(storageKey);
      if (raw == null) return;
      final j = jsonDecode(raw) as Map<String,dynamic>;
      address = j['address']??address; addressNote=j['addressNote']??''; preference=j['preference']??'All food'; coupon=j['coupon']??'';
      favorites.addAll((j['favorites'] as List? ?? []).cast<String>());
      favoriteDishes.addAll((j['favoriteDishes'] as List? ?? []).cast<String>());
      restaurantId=j['restaurant'];
      for(final l in j['cart'] as List? ?? []) { cart.add(FoodLine.fromJson(Map<String,dynamic>.from(l))); }
      if (cart.isNotEmpty && !restaurantById(restaurantId!).dishes.map((d)=>d.id).toSet().containsAll(cart.map((l)=>l.dishId))) throw const FormatException('Invalid cart');
      for(final o in j['orders'] as List? ?? []) { final order=FoodOrder.fromJson(Map<String,dynamic>.from(o)); restaurantById(order.restaurantId); if(order.stage<0||order.stage>5) continue; orders.add(order); }
    } catch (_) { cart.clear(); restaurantId=null; storageError='Some saved food data could not be loaded. You can continue with a new cart.'; }
    notifyListeners();
  }
  int get count => cart.fold(0,(a,l)=>a+l.quantity);
  int get subtotal => cart.fold(0,(a,l)=>a+l.total);
  int get discount => coupon=='ZEMEN100' && subtotal>=500 ? 100 : 0;
  int get serviceFee => cart.isEmpty ? 0 : (subtotal * .05).round();
  int get deliveryFee => cart.isEmpty ? 0 : restaurantById(restaurantId!).fee;
  int get total => subtotal-discount+serviceFee+deliveryFee;
  int get points => orders.where((o)=>o.stage==4).length*20;
  Future<void> save() async {
    notifyListeners();
    final json=jsonEncode({'address':address,'addressNote':addressNote,'preference':preference,'coupon':coupon,'favorites':favorites.toList(),'favoriteDishes':favoriteDishes.toList(),'restaurant':restaurantId,'cart':cart.map((l)=>l.toJson()).toList(),'orders':orders.map((o)=>o.toJson()).toList()});
    _writes=_writes.then((_) async { try { await _prefs?.setString(storageKey,json); } catch (_) { storageError='Unable to save food demo changes on this device.'; notifyListeners(); } });
    await _writes;
  }
  Future<void> favorite(String id, {bool dish=false}) async { final set=dish?favoriteDishes:favorites; if(!set.add(id)) set.remove(id); await save(); }
  Future<void> add(String r, FoodDish d, int quantity, String note) async {
    if(quantity<1||quantity>99) throw ArgumentError('Choose 1–99 items');
    if(cart.isNotEmpty && restaurantId!=r) throw StateError('Keep one restaurant per order');
    if(!restaurantById(r).dishes.contains(d)) throw ArgumentError('Dish is from another restaurant');
    final existing=cart.where((l)=>l.dishId==d.id&&l.note==note).firstOrNull;
    if((existing?.quantity??0)+quantity>99) throw StateError('Maximum 99 per item');
    restaurantId=r;
    if(existing==null) { cart.add(FoodLine(d.id,quantity,note)); } else { existing.quantity+=quantity; }
    await save();
  }
  Future<void> quantity(FoodLine l, int delta) async { if(!cart.contains(l)) return; if(l.quantity+delta>99) return; l.quantity+=delta; if(l.quantity<=0) cart.remove(l); if(cart.isEmpty) { restaurantId=null; coupon=''; } await save(); }
  Future<void> clear() async { cart.clear(); restaurantId=null; coupon=''; await save(); }
  Future<void> applyCoupon(String code) async { if(code.trim().toUpperCase()!='ZEMEN100') throw StateError('Use ZEMEN100 for this demo'); if(subtotal<500) throw StateError('A minimum food subtotal of ETB 500 is required'); coupon='ZEMEN100'; await save(); }
  Future<FoodOrder> place({required String method, String restaurantNote='',String courierNote='',String phone='',bool callOnArrival=false}) async {
    if(cart.isEmpty) throw StateError('Your cart is empty');
    if(orders.any((o)=>o.active)) throw StateError('Complete or cancel your active demo order first');
    if(address.trim().length<6) throw StateError('Add a complete delivery address');
    if(!['Cash','Chapa'].contains(method)) throw StateError('Select a payment method');
    final o=FoodOrder(id:'FOOD-${DateTime.now().microsecondsSinceEpoch}',restaurantId:restaurantId!,lines:cart.map((l)=>FoodLine(l.dishId,l.quantity,l.note)).toList(),address:'$address${addressNote.isEmpty?'':' · $addressNote'}',method:method,subtotal:subtotal,discount:discount,serviceFee:serviceFee,deliveryFee:deliveryFee,date:DateTime.now().toIso8601String(),restaurantNote:restaurantNote,courierNote:courierNote,phone:phone,callOnArrival:callOnArrival);
    orders.insert(0,o); cart.clear(); restaurantId=null; coupon=''; await save(); return o;
  }
  Future<void> advance(FoodOrder o) async { if(!o.active) return; o.stage++; await save(); }
  Future<void> cancel(FoodOrder o) async { if(o.stage>1) throw StateError('Preparation has started. Use demo support for help.'); o.stage=5; await save(); }
  Future<void> rate(FoodOrder o,int stars) async { if(o.stage!=4||stars<1||stars>5) throw StateError('Rate a delivered order'); o.rating=stars; await save(); }
  Future<void> reorder(FoodOrder o) async { if(cart.isNotEmpty) throw StateError('Clear your current cart before reordering'); restaurantId=o.restaurantId; cart.addAll(o.lines.map((l)=>FoodLine(l.dishId,l.quantity,l.note))); await save(); }
}
