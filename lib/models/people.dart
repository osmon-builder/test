// To parse this JSON data, do
//
//     final scanModel = scanModelFromJson(jsonString);

// To parse this JSON data, do
//
//     final scanModel = scanModelFromJson(jsonString);

import 'dart:convert';

ScanModel scanModelFromJson(String str) => ScanModel.fromJson(json.decode(str));

String scanModelToJson(ScanModel data) => json.encode(data.toJson());

class ScanModel {
    ScanModel({
        required this.results,
        required this.info,
    });

    List<Result> results;
    Info info;

    factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        info: Info.fromJson(json["info"]),
    );

    Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "info": info.toJson(),
    };
}

class Info {
    Info({
        required this.seed,
        required this.results,
        required this.page,
        required this.version,
    });

    String seed;
    int results;
    int page;
    String version;

    factory Info.fromJson(Map<String, dynamic> json) => Info(
        seed: json["seed"],
        results: json["results"],
        page: json["page"],
        version: json["version"],
    );

    Map<String, dynamic> toJson() => {
        "seed": seed,
        "results": results,
        "page": page,
        "version": version,
    };
}

class Result {
    Result({
        required this.gender,
        required this.name,
        required this.location,
        required this.email,
        required this.login,
        required this.dob,
        required this.registered,
        required this.phone,
        required this.cell,
         this.id,
        required this.picture,
        required this.nat,
    });

    Gender? gender;
    Name name;
    Location location;
    String email;
    Login login;
    Dob dob;
    Dob registered;
    String phone;
    String cell;
    String? id;
    Picture picture;
    String nat;

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        gender: genderValues.map[json["gender"]]!,
        name: Name.fromJson(json["name"]),
        location: Location.fromJson(json["location"]),
        email: json["email"],
        login: Login.fromJson(json["login"]),
        dob: Dob.fromJson(json["dob"]),
        registered: Dob.fromJson(json["registered"]),
        phone: json["phone"],
        cell: json["cell"],
        picture: Picture.fromJson(json["picture"]),

        nat: json["nat"],
    );

    Map<String, dynamic> toJson() => {
        "gender": genderValues.reverse[gender],
        "name": name.toJson(),
        "location": location.toJson(),
        "email": email,
        "login": login.toJson(),
        "dob": dob.toJson(),
        "registered": registered.toJson(),
        "phone": phone,
        "cell": cell,

   
        "nat": nat,
    };
}

class Dob {
    Dob({
        required this.date,
        required this.age,
    });

    DateTime date;
    int age;

    factory Dob.fromJson(Map<String, dynamic> json) => Dob(
        date: DateTime.parse(json["date"]),
        age: json["age"],
    );

    Map<String, dynamic> toJson() => {
        "date": date.toIso8601String(),
        "age": age,
    };
}

enum Gender { MALE, FEMALE }

final genderValues = EnumValues({
    "female": Gender.FEMALE,
    "male": Gender.MALE
});



class Location {
    Location({
        required this.street,
        required this.city,
        required this.state,
        required this.country,
        required this.postcode,
        required this.coordinates,
        required this.timezone,
    });

    Street street;
    String city;
    String state;
    String country;
    dynamic postcode;
    Coordinates coordinates;
    Timezone timezone;

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        street: Street.fromJson(json["street"]),
        city: json["city"],
        state: json["state"],
        country: json["country"],
        postcode: json["postcode"],
        coordinates: Coordinates.fromJson(json["coordinates"]),
        timezone: Timezone.fromJson(json["timezone"]),
    );

    Map<String, dynamic> toJson() => {
        "street": street.toJson(),
        "city": city,
        "state": state,
        "country": country,
        "postcode": postcode,
        "coordinates": coordinates.toJson(),
        "timezone": timezone.toJson(),
    };
}

class Coordinates {
    Coordinates({
        required this.latitude,
        required this.longitude,
    });

    String latitude;
    String longitude;

    factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        latitude: json["latitude"],
        longitude: json["longitude"],
    );

    Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
    };
}

class Street {
    Street({
        required this.number,
        required this.name,
    });

    int number;
    String name;

    factory Street.fromJson(Map<String, dynamic> json) => Street(
        number: json["number"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "number": number,
        "name": name,
    };
}

class Timezone {
    Timezone({
        required this.offset,
        required this.description,
    });

    String offset;
    String description;

    factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
        offset: json["offset"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "offset": offset,
        "description": description,
    };
}

class Login {
    Login({
        required this.uuid,
        required this.username,
        required this.password,
        required this.salt,
        required this.md5,
        required this.sha1,
        required this.sha256,
    });

    String uuid;
    String username;
    String password;
    String salt;
    String md5;
    String sha1;
    String sha256;

    factory Login.fromJson(Map<String, dynamic> json) => Login(
        uuid: json["uuid"],
        username: json["username"],
        password: json["password"],
        salt: json["salt"],
        md5: json["md5"],
        sha1: json["sha1"],
        sha256: json["sha256"],
    );

    Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "username": username,
        "password": password,
        "salt": salt,
        "md5": md5,
        "sha1": sha1,
        "sha256": sha256,
    };
}

class Name {
    Name({
        required this.title,
        required this.first,
        required this.last,
    });

    String title;
    String first;
    String last;

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        title: json["title"],
        first: json["first"],
        last: json["last"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "first": first,
        "last": last,
    };
}

class Picture {
    Picture({
        required this.large,
        required this.medium,
        required this.thumbnail,
    });

    String large;
    String medium;
    String thumbnail;

    factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        large: json["large"],
        medium: json["medium"],
        thumbnail: json["thumbnail"],
    );

  
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
