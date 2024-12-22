class loginDetailsRes {
  int? id;
  String? ipAddress;
  String? latitude;
  String? longitude;
  dynamic? timestamp;
  Null? qrCode;
  String? randomNumber;

  loginDetailsRes(
      {this.id,
        this.ipAddress,
        this.latitude,
        this.longitude,
        this.timestamp,
        this.qrCode,
        this.randomNumber});

  loginDetailsRes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ipAddress = json['ip_address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    timestamp = json['timestamp'];
    qrCode = json['qr_code'];
    randomNumber = json['random_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ip_address'] = this.ipAddress;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['timestamp'] = this.timestamp;
    data['qr_code'] = this.qrCode;
    data['random_number'] = this.randomNumber;
    return data;
  }
  @override
  String toString() {
    return 'ID: $id, IP: $ipAddress, Lat: $latitude, Long: $longitude, Timestamp: $timestamp, QR: $qrCode, Random: $randomNumber';
  }
}