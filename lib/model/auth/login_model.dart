// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    LoginModel({
        this.status,
        this.message,
        this.userInfo,
        this.accessToken,
        this.tokenType,
    });

    String? status;
    String? message;
    UserInfo? userInfo;
    String? accessToken;
    String? tokenType;

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        message: json["message"],
        userInfo: json["userInfo"] == null ? null : UserInfo.fromJson(json["userInfo"]),
        accessToken: json["accessToken"],
        tokenType: json["tokenType"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "userInfo": userInfo?.toJson(),
        "accessToken": accessToken,
        "tokenType": tokenType,
    };
}

class UserInfo {
    UserInfo({
        this.id,
        this.name,
        this.email,
        this.emailVerifiedAt,
        this.province,
        this.regency,
        this.address,
        this.phone,
        this.info,
        this.bankName,
        this.bankAccount,
        this.coKind,
        this.identity,
        this.npwp,
        this.nib,
        this.twoFactorConfirmedAt,
        this.currentTeamId,
        this.profilePhotoPath,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.birthdate,
        this.profileUrl,
        this.identityUrl,
        this.npwpUrl,
        this.nibUrl,
    });

    int? id;
    String? name;
    String? email;
    dynamic emailVerifiedAt;
    String? province;
    String? regency;
    String? address;
    String? phone;
    dynamic info;
    dynamic bankName;
    dynamic bankAccount;
    dynamic coKind;
    dynamic identity;
    dynamic npwp;
    dynamic nib;
    dynamic twoFactorConfirmedAt;
    dynamic currentTeamId;
    String? profilePhotoPath;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;
    dynamic birthdate;
    String? profileUrl;
    String? identityUrl;
    String? npwpUrl;
    String? nibUrl;

    factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        province: json["province"],
        regency: json["regency"],
        address: json["address"],
        phone: json["phone"],
        info: json["info"],
        bankName: json["bank_name"],
        bankAccount: json["bank_account"],
        coKind: json["co_kind"],
        identity: json["identity"],
        npwp: json["npwp"],
        nib: json["nib"],
        twoFactorConfirmedAt: json["two_factor_confirmed_at"],
        currentTeamId: json["current_team_id"],
        profilePhotoPath: json["profile_photo_path"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        birthdate: json["birthdate"],
        profileUrl: json["profile_url"],
        identityUrl: json["identity_url"],
        npwpUrl: json["npwp_url"],
        nibUrl: json["nib_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "province": province,
        "regency": regency,
        "address": address,
        "phone": phone,
        "info": info,
        "bank_name": bankName,
        "bank_account": bankAccount,
        "co_kind": coKind,
        "identity": identity,
        "npwp": npwp,
        "nib": nib,
        "two_factor_confirmed_at": twoFactorConfirmedAt,
        "current_team_id": currentTeamId,
        "profile_photo_path": profilePhotoPath,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "birthdate": birthdate,
        "profile_url": profileUrl,
        "identity_url": identityUrl,
        "npwp_url": npwpUrl,
        "nib_url": nibUrl,
    };
}
