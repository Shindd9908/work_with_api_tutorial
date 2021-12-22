class Results {
    String? provinceId;
    String? provinceName;
    String? provinceType;

    Results({this.provinceId, this.provinceName, this.provinceType});

    Results.fromJson(Map<String, dynamic> json) {
        if(json["province_id"] is String)
            this.provinceId = json["province_id"];
        if(json["province_name"] is String)
            this.provinceName = json["province_name"];
        if(json["province_type"] is String)
            this.provinceType = json["province_type"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data["province_id"] = this.provinceId;
        data["province_name"] = this.provinceName;
        data["province_type"] = this.provinceType;
        return data;
    }
}