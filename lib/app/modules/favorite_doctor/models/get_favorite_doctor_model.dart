class GetFavoriteDoctor {
  List<FavoriteDoctorsData>? data;
  String? msg;
  int? code;

  GetFavoriteDoctor({this.data, this.msg, this.code});

  GetFavoriteDoctor.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <FavoriteDoctorsData>[];
      json['data'].forEach((v) {
        data!.add(FavoriteDoctorsData.fromJson(v));
      });
    }
    msg = json['msg'];
    code = json['code'];
  }

}

class FavoriteDoctorsData {
  int? id;
  String? name;
  String? rateAvg;
  Description? description;
  String? profileImage;
  List<Specializations>? specializations;

  FavoriteDoctorsData(
      {this.id,
      this.name,
      this.rateAvg,
      this.description,
      this.profileImage,
      this.specializations});

  FavoriteDoctorsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    rateAvg = json['rate_avg'];
    description = json['description'] != null
        ? Description.fromJson(json['description'])
        : null;
    profileImage = json['profile_image'];
    if (json['specializations'] != null) {
      specializations = <Specializations>[];
      json['specializations'].forEach((v) {
        specializations!.add(Specializations.fromJson(v));
      });
    }
  }

}

class Description {
  String? ar;
  String? en;

  Description({this.ar, this.en});

  Description.fromJson(Map<String, dynamic> json) {
    ar = json['ar'];
    en = json['en'];
  }

}

class Specializations {
  Name? name;

  Specializations({this.name});

  Specializations.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
  }

}

class Name {
  int? id;
  String? ar;
  String? en;

  Name({this.id, this.ar, this.en});

  Name.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ar = json['ar'];
    en = json['en'];
  }

}

// class GetFavoriteDoctor {
//   int? code;
//   List<FavoriteDoctorsData>? data;
//   Links? links;
//   Meta? meta;

//   GetFavoriteDoctor({this.code, this.data, this.links, this.meta});

//   GetFavoriteDoctor.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     if (json['data'] != null) {
//       data = <FavoriteDoctorsData>[];
//       json['data'].forEach((v) {
//         data?.add(FavoriteDoctorsData.fromJson(v));
//       });
//     }
//     links = json['links'] != null ? Links?.fromJson(json['links']) : null;
//     meta = json['meta'] != null ? Meta?.fromJson(json['meta']) : null;
//   }
// }

// class FavoriteDoctorsData {
//   int? id;
//   int? experienceYears;
//   String? placeOfStudy;
//   String? image;
//   String? certificates;
//   String? socialMedia;
//   String? aboutTheDoctor;
//   double? ratingPercentage;
//   int? consultationPrice;
//   String? skills;
//   int? iqama;
//   String? workExperience;
//   String? authorityCard;
//   String? healthAffairsLicensing;
//   bool? isFavorite;
//   int? isVerified;
//   int? isReceivingAppointments;
//   Doctor? doctor;
//   List<Ratings>? ratings;
//   String? createdAt;
//   String? updatedAt;

//   FavoriteDoctorsData(
//       {this.id,
//       this.experienceYears,
//       this.placeOfStudy,
//       this.image,
//       this.certificates,
//       this.socialMedia,
//       this.aboutTheDoctor,
//       this.ratingPercentage,
//       this.consultationPrice,
//       this.skills,
//       this.iqama,
//       this.workExperience,
//       this.authorityCard,
//       this.healthAffairsLicensing,
//       this.isFavorite,
//       this.isVerified,
//       this.isReceivingAppointments,
//       this.doctor,
//       this.ratings,
//       this.createdAt,
//       this.updatedAt});

//   FavoriteDoctorsData.fromJson(Map<String, dynamic> json) {
//     id = json['id'] ?? 0;
//     experienceYears = json['experience_years'] ?? 0;
//     placeOfStudy = json['place_of_study'] ?? "";
//     image = json['image'] ?? "";
//     certificates = json['certificates'] ?? "";
//     socialMedia = json['social_media'] ?? "";
//     aboutTheDoctor = json['about_the_doctor'] ?? "";
//     ratingPercentage = json['rating_percentage'].toDouble();
//     consultationPrice = json['consultation_price'] ?? 0;
//     skills = json['skills'] ?? "";
//     iqama = json['iqama'] ?? 0;
//     workExperience = json['work_experience'] ?? "";
//     authorityCard = json['authority_card'] ?? "";
//     healthAffairsLicensing = json['health_affairs_licensing'] ?? "";
//     isFavorite = json['is_favorite'] ?? false;
//     isVerified = json['is_verified'] ?? 0;
//     isReceivingAppointments = json['is_receiving_appointments'] ?? 0;
//     doctor = json['doctor'] != null ? Doctor?.fromJson(json['doctor']) : null;
//     if (json['ratings'] != null) {
//       ratings = <Ratings>[];
//       json['ratings'].forEach((v) {
//         ratings?.add(Ratings.fromJson(v));
//       });
//     }
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['experience_years'] = experienceYears;
//     data['place_of_study'] = placeOfStudy;
//     data['image'] = image;
//     data['certificates'] = certificates;
//     data['social_media'] = socialMedia;
//     data['about_the_doctor'] = aboutTheDoctor;
//     data['rating_percentage'] = ratingPercentage;
//     data['consultation_price'] = consultationPrice;
//     data['skills'] = skills;
//     data['iqama'] = iqama;
//     data['work_experience'] = workExperience;
//     data['authority_card'] = authorityCard;
//     data['health_affairs_licensing'] = healthAffairsLicensing;
//     data['is_favorite'] = isFavorite;
//     data['is_verified'] = isVerified;
//     data['is_receiving_appointments'] = isReceivingAppointments;
//     if (doctor != null) {
//       data['doctor'] = doctor?.toJson();
//     }
//     if (ratings != null) {
//       data['ratings'] = ratings?.map((v) => v.toJson()).toList();
//     }
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     return data;
//   }
// }

// class Doctor {
//   int? id;
//   String? fname;
//   String? lname;
//   String? username;
//   String? iqama;
//   String? phone;
//   String? code;
//   String? otherPhone;
//   String? birthDate;
//   String? gender;
//   String? email;
//   String? image;
//   String? address;
//   int? isActive;
//   String? userType;
//   String? createdAt;
//   String? updatedAt;

//   Doctor(
//       {this.id,
//       this.fname,
//       this.lname,
//       this.username,
//       this.iqama,
//       this.phone,
//       this.code,
//       this.otherPhone,
//       this.birthDate,
//       this.gender,
//       this.email,
//       this.image,
//       this.address,
//       this.isActive,
//       this.userType,
//       this.createdAt,
//       this.updatedAt});

//   Doctor.fromJson(Map<String, dynamic> json) {
//     id = json['id'] ?? 0;
//     fname = json['fname'] ?? "";
//     lname = json['lname'] ?? "";
//     username = json['username'] ?? "";
//     iqama = json['iqama'] ?? "";
//     phone = json['phone'] ?? "";
//     code = json['code'] ?? "";
//     otherPhone = json['other_phone'] ?? "";
//     birthDate = json['birth_date'] ?? "";
//     gender = json['gender'] ?? "";
//     email = json['email'] ?? "";
//     image = json['image'] ?? "";
//     address = json['address'] ?? "";
//     isActive = json['is_active'] ?? 0;
//     userType = json['user_type'] ?? "";
//     createdAt = json['created_at'] ?? "";
//     updatedAt = json['updated_at'] ?? "";
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['fname'] = fname;
//     data['lname'] = lname;
//     data['username'] = username;
//     data['iqama'] = iqama;
//     data['phone'] = phone;
//     data['code'] = code;
//     data['other_phone'] = otherPhone;
//     data['birth_date'] = birthDate;
//     data['gender'] = gender;
//     data['email'] = email;
//     data['image'] = image;
//     data['address'] = address;
//     data['is_active'] = isActive;
//     data['user_type'] = userType;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     return data;
//   }
// }

// class Ratings {
//   int? id;
//   String? note;
//   int? amount;
//   String? date;
//   Profile? profile;
//   String? createdAt;
//   String? updatedAt;

//   Ratings(
//       {this.id,
//       this.note,
//       this.amount,
//       this.date,
//       this.profile,
//       this.createdAt,
//       this.updatedAt});

//   Ratings.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     note = json['note'];
//     amount = json['amount'];
//     date = json['date'];
//     profile =
//         json['profile'] != null ? Profile?.fromJson(json['profile']) : null;
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id ?? 0;
//     data['note'] = note ?? "";
//     data['amount'] = amount ?? 0;
//     data['date'] = date ?? "";
//     if (profile != null) {
//       data['profile'] = profile?.toJson();
//     }
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     return data;
//   }
// }

// class Profile {
//   int? id;
//   String? patientNumber;
//   String? maritalStatus;
//   int? height;
//   int? weight;
//   String? familyMemberPhone;
//   int? psychiatrist;
//   String? psychiatristDescription;
//   int? disability;
//   String? disabilityDescription;
//   int? healthProblem;
//   String? healthProblemDescription;
//   int? medication;
//   String? medicationDescription;
//   List<String>? habits;
//   String? habitsOtherDetails;
//   int? diseases;
//   String? diseasesOtherDetails;
//   Doctor? patient;
//   String? createdAt;
//   String? updatedAt;

//   Profile(
//       {this.id,
//       this.patientNumber,
//       this.maritalStatus,
//       this.height,
//       this.weight,
//       this.familyMemberPhone,
//       this.psychiatrist,
//       this.psychiatristDescription,
//       this.disability,
//       this.disabilityDescription,
//       this.healthProblem,
//       this.healthProblemDescription,
//       this.medication,
//       this.medicationDescription,
//       this.habits,
//       this.habitsOtherDetails,
//       this.diseases,
//       this.diseasesOtherDetails,
//       this.patient,
//       this.createdAt,
//       this.updatedAt});

//   Profile.fromJson(Map<String, dynamic> json) {
//     id = json['id'] ?? 0;
//     patientNumber = json['patient_number'] ?? "";
//     maritalStatus = json['marital_status'] ?? "";
//     height = json['height'] ?? 0;
//     weight = json['weight'] ?? 0;
//     familyMemberPhone = json['family_member_phone'] ?? "";
//     psychiatrist = json['psychiatrist'] ?? 0;
//     psychiatristDescription = json['psychiatrist_description'] ?? "";
//     disability = json['disability'] ?? 0;
//     disabilityDescription = json['disability_description'] ?? "";
//     healthProblem = json['health_problem'] ?? 0;
//     healthProblemDescription = json['health_problem_description'] ?? "";
//     medication = json['medication'] ?? 0;
//     medicationDescription = json['medication_description'] ?? "";
//     habits = json['habits'].cast<String>();
//     habitsOtherDetails = json['habits_other_details'] ?? "";
//     diseases = json['diseases'] ?? 0;
//     diseasesOtherDetails = json['diseases_other_details'] ?? "";
//     patient =
//         json['patient'] != null ? Doctor?.fromJson(json['patient']) : null;
//     createdAt = json['created_at'] ?? "";
//     updatedAt = json['updated_at'] ?? "";
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['patient_number'] = patientNumber;
//     data['marital_status'] = maritalStatus;
//     data['height'] = height;
//     data['weight'] = weight;
//     data['family_member_phone'] = familyMemberPhone;
//     data['psychiatrist'] = psychiatrist;
//     data['psychiatrist_description'] = psychiatristDescription;
//     data['disability'] = disability;
//     data['disability_description'] = disabilityDescription;
//     data['health_problem'] = healthProblem;
//     data['health_problem_description'] = healthProblemDescription;
//     data['medication'] = medication;
//     data['medication_description'] = medicationDescription;
//     data['habits'] = habits;
//     data['habits_other_details'] = habitsOtherDetails;
//     data['diseases'] = diseases;
//     data['diseases_other_details'] = diseasesOtherDetails;
//     if (patient != null) {
//       data['patient'] = patient?.toJson();
//     }
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     return data;
//   }
// }

// class Links {
//   String? self;
//   String? first;
//   String? last;
//   dynamic prev;
//   dynamic next;

//   Links({this.self, this.first, this.last, this.prev, this.next});

//   Links.fromJson(Map<String, dynamic> json) {
//     self = json['self'];
//     first = json['first'];
//     last = json['last'];
//     prev = json['prev'];
//     next = json['next'];
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['self'] = self;
//     data['first'] = first;
//     data['last'] = last;
//     data['prev'] = prev;
//     data['next'] = next;
//     return data;
//   }
// }

// class Meta {
//   int? currentPage;
//   int? from;
//   int? lastPage;
//   List<Links>? links;
//   String? path;
//   int? perPage;
//   int? to;
//   int? total;

//   Meta(
//       {this.currentPage,
//       this.from,
//       this.lastPage,
//       this.links,
//       this.path,
//       this.perPage,
//       this.to,
//       this.total});

//   Meta.fromJson(Map<String, dynamic> json) {
//     currentPage = json['current_page'];
//     from = json['from'];
//     lastPage = json['last_page'];
//     if (json['links'] != null) {
//       links = <Links>[];
//       json['links'].forEach((v) {
//         links?.add(Links.fromJson(v));
//       });
//     }
//     path = json['path'];
//     perPage = json['per_page'];
//     to = json['to'];
//     total = json['total'];
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['current_page'] = currentPage;
//     data['from'] = from;
//     data['last_page'] = lastPage;
//     if (links != null) {
//       data['links'] = links?.map((v) => v.toJson()).toList();
//     }
//     data['path'] = path;
//     data['per_page'] = perPage;
//     data['to'] = to;
//     data['total'] = total;
//     return data;
//   }
// }
