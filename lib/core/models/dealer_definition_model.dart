 // To parse this JSON data, do
//
//     final dealerDefinitionResponse = dealerDefinitionResponseFromJson(jsonString);

import 'dart:convert';

DealerDefinitionResponse dealerDefinitionResponseFromJson(String str) => DealerDefinitionResponse.fromJson(json.decode(str));

String dealerDefinitionResponseToJson(DealerDefinitionResponse data) => json.encode(data.toJson());

class DealerDefinitionResponse {
    String? message;
    int? code;
    List<Fertilizer>? general;
    List<Fertilizer>? fertilizer;
    List<Fertilizer>? valve;
    List<Fertilizer>? memory;

    DealerDefinitionResponse({
        this.message,
        this.code,
        this.general,
        this.fertilizer,
        this.valve,
        this.memory,
    });

    factory DealerDefinitionResponse.fromJson(Map<String, dynamic> json) => DealerDefinitionResponse(
        message: json["message"],
        code: json["code"],
        general: json["General"] == null ? [] : List<Fertilizer>.from(json["General"]!.map((x) => Fertilizer.fromJson(x))),
        fertilizer: json["Fertilizer"] == null ? [] : List<Fertilizer>.from(json["Fertilizer"]!.map((x) => Fertilizer.fromJson(x))),
        valve: json["Valve"] == null ? [] : List<Fertilizer>.from(json["Valve"]!.map((x) => Fertilizer.fromJson(x))),
        memory: json["Memory"] == null ? [] : List<Fertilizer>.from(json["Memory"]!.map((x) => Fertilizer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "code": code,
        "General": general == null ? [] : List<dynamic>.from(general!.map((x) => x.toJson())),
        "Fertilizer": fertilizer == null ? [] : List<dynamic>.from(fertilizer!.map((x) => x.toJson())),
        "Valve": valve == null ? [] : List<dynamic>.from(valve!.map((x) => x.toJson())),
        "Memory": memory == null ? [] : List<dynamic>.from(memory!.map((x) => x.toJson())),
    };
}

class Fertilizer {
    String? title;
    String? description;
    String? value;
    String? valuetype;
    List<dynamic>? dropdownlist;

    Fertilizer({
        this.title,
        this.description,
        this.value,
        this.valuetype,
        this.dropdownlist,
    });

    factory Fertilizer.fromJson(Map<String, dynamic> json) => Fertilizer(
        title: json["title"],
        description: json["description"],
        value: json["value"],
        valuetype: json["valuetype"],
        dropdownlist: json["dropdownlist"] == null ? [] : List<String>.from(json["dropdownlist"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "value": value,
        "valuetype": valuetype,
        "dropdownlist": dropdownlist == null ? [] : List<String>.from(dropdownlist!.map((x) => x)),
    };
}

// To parse this JSON data, do
//
//     final dealerDefinitionRequest = dealerDefinitionRequestFromJson(jsonString);

 
DealerDefinitionRequest dealerDefinitionRequestFromJson(String str) => DealerDefinitionRequest.fromJson(json.decode(str));

String dealerDefinitionRequestToJson(DealerDefinitionRequest data) => json.encode(data.toJson());

class DealerDefinitionRequest {
    String? active;

    DealerDefinitionRequest({
        this.active,
    });

    factory DealerDefinitionRequest.fromJson(Map<String, dynamic> json) => DealerDefinitionRequest(
        active: json["active"],
    );

    Map<String, dynamic> toJson() => {
        "active": active,
    };
}

