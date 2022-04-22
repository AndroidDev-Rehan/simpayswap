// To parse this JSON data, do
//
//     final kycModel = kycModelFromJson(jsonString);

import 'dart:convert';

KycModel kycModelFromJson(String str) => KycModel.fromJson(json.decode(str));

String kycModelToJson(KycModel data) => json.encode(data.toJson());

class KycModel {
  KycModel({
    required this.id,
    required this.status,
    required this.score,
    required this.created,
    required this.updated,
    required this.owner,
    required this.resources,
    this.watchlist,
    this.metadata,
  });

  String id;
  String status;
  double score;
  int created;
  int updated;
  Owner owner;
  List<Resource> resources;
  dynamic watchlist;
  dynamic metadata;

  factory KycModel.fromJson(Map<String, dynamic> json) => KycModel(
    id: json["id"],
    status: json["status"],
    score: json["score"],
    created: json["created"],
    updated: json["updated"],
    owner: Owner.fromJson(json["owner"]),
    resources: List<Resource>.from(json["resources"].map((x) => Resource.fromJson(x))),
    watchlist: json["watchlist"],
    metadata: json["metadata"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": status,
    "score": score,
    "created": created,
    "updated": updated,
    "owner": owner.toJson(),
    "resources": List<dynamic>.from(resources.map((x) => x.toJson())),
    "watchlist": watchlist,
    "metadata": metadata,
  };
}

class Owner {
  Owner({
    required this.email,
    required this.firstName,
    required this.lastName,
  });

  String email;
  String firstName;
  String lastName;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
  };
}

class Resource {
  Resource({
    required this.id,
    required this.status,
    required this.created,
    required this.updated,
    required this.type,
    required this.datapoints,
    required this.resourceFiles,
  });

  String id;
  String status;
  int created;
  int updated;
  String type;
  Datapoints datapoints;
  List<ResourceFile> resourceFiles;

  factory Resource.fromJson(Map<String, dynamic> json) => Resource(
    id: json["id"],
    status: json["status"],
    created: json["created"],
    updated: json["updated"],
    type: json["type"],
    datapoints: Datapoints.fromJson(json["datapoints"]),
    resourceFiles: List<ResourceFile>.from(json["resource_files"].map((x) => ResourceFile.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": status,
    "created": created,
    "updated": updated,
    "type": type,
    "datapoints": datapoints.toJson(),
    "resource_files": List<dynamic>.from(resourceFiles.map((x) => x.toJson())),
  };
}

class Datapoints {
  Datapoints({
    required this.idAuthenticityFactor,
    required this.personalIdNumber,
    required this.dateOfExpiry,
    required this.dateOfIssue,
    required this.country,
    required this.documentOriginCountry,
    required this.faceMatchFactor,
  });

  double idAuthenticityFactor;
  String personalIdNumber;
  DateTime dateOfExpiry;
  DateTime dateOfIssue;
  String country;
  String documentOriginCountry;
  double faceMatchFactor;

  factory Datapoints.fromJson(Map<String, dynamic> json) => Datapoints(
    idAuthenticityFactor: json["id_authenticity_factor"],
    personalIdNumber: json["personal_id_number"],
    dateOfExpiry: DateTime.parse(json["date_of_expiry"]),
    dateOfIssue: DateTime.parse(json["date_of_issue"]),
    country: json["country"],
    documentOriginCountry: json["document_origin_country"],
    faceMatchFactor: json["face_match_factor"],
  );

  Map<String, dynamic> toJson() => {
    "id_authenticity_factor": idAuthenticityFactor,
    "personal_id_number": personalIdNumber,
    "date_of_expiry": "${dateOfExpiry.year.toString().padLeft(4, '0')}-${dateOfExpiry.month.toString().padLeft(2, '0')}-${dateOfExpiry.day.toString().padLeft(2, '0')}",
    "date_of_issue": "${dateOfIssue.year.toString().padLeft(4, '0')}-${dateOfIssue.month.toString().padLeft(2, '0')}-${dateOfIssue.day.toString().padLeft(2, '0')}",
    "country": country,
    "document_origin_country": documentOriginCountry,
    "face_match_factor": faceMatchFactor,
  };
}

class ResourceFile {
  ResourceFile({
    required this.id,
    required this.type,
    required this.page,
    required this.created,
    required this.updated,
  });

  String id;
  String type;
  int page;
  int created;
  int updated;

  factory ResourceFile.fromJson(Map<String, dynamic> json) => ResourceFile(
    id: json["id"],
    type: json["type"],
    page: json["page"],
    created: json["created"],
    updated: json["updated"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "page": page,
    "created": created,
    "updated": updated,
  };
}
