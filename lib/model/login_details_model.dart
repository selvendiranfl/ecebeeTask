class loginDetailsRes {
  int? id;
  String? ipAddress;
  String? location;
  String? phone_number;
  dynamic? timestamp;
  Null? qrCode;
  String? randomNumber;

  loginDetailsRes(
      {this.id,
        this.ipAddress,
        this.location,
        this.phone_number,
        this.timestamp,
        this.qrCode,
        this.randomNumber});

  loginDetailsRes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ipAddress = json['ip_address'];
    location = json['location'];
    phone_number = json['longitude'];
    timestamp = json['timestamp'];
    qrCode = json['qr_code'];
    randomNumber = json['random_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['ip_address'] = this.ipAddress;
    data['location'] = this.location;
    data['longitude'] = this.phone_number;
    data['timestamp'] = this.timestamp;
    data['qr_code'] = this.qrCode;
    data['random_number'] = this.randomNumber;
    return data;
  }
  @override
  String toString() {
    return 'ID: $id, IP: $ipAddress, Location: $location, Long: $phone_number, Timestamp: $timestamp, QR: $qrCode, Random: $randomNumber';
  }
}