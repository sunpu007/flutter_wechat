class SocketModel {
  Cpu? cpu;
  Mem? mem;
  String? time;
  Sys? sys;
  Disk? disk;

  SocketModel({this.cpu, this.mem, this.time, this.sys, this.disk});

  SocketModel.fromJson(Map<String, dynamic> json) {
    cpu = json['cpu'] != null ? new Cpu.fromJson(json['cpu']) : null;
    mem = json['mem'] != null ? new Mem.fromJson(json['mem']) : null;
    time = json['time'];
    sys = json['sys'] != null ? new Sys.fromJson(json['sys']) : null;
    disk = json['disk'] != null ? new Disk.fromJson(json['disk']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cpu != null) {
      data['cpu'] = this.cpu!.toJson();
    }
    if (this.mem != null) {
      data['mem'] = this.mem!.toJson();
    }
    data['time'] = this.time;
    if (this.sys != null) {
      data['sys'] = this.sys!.toJson();
    }
    if (this.disk != null) {
      data['disk'] = this.disk!.toJson();
    }
    return data;
  }
}

class Cpu {
  double? used;
  String? name;
  double? threadNumber;

  Cpu({this.used, this.name, this.threadNumber});

  Cpu.fromJson(Map<String, dynamic> json) {
    used = double.parse(json['used'].toString());
    name = json['name'];
    threadNumber = double.parse(json['threadNumber'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['used'] = this.used;
    data['name'] = this.name;
    data['threadNumber'] = this.threadNumber;
    return data;
  }
}

class Mem {
  String? totalmem;
  double? freemem;
  String? usedmem;
  String? usageRate;

  Mem({this.totalmem, this.freemem, this.usedmem, this.usageRate});

  Mem.fromJson(Map<String, dynamic> json) {
    totalmem = json['totalmem'];
    freemem = double.parse(json['freemem'].toString());
    usedmem = json['usedmem'];
    usageRate = json['usageRate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalmem'] = this.totalmem;
    data['freemem'] = this.freemem;
    data['usedmem'] = this.usedmem;
    data['usageRate'] = this.usageRate;
    return data;
  }
}

class Sys {
  String? date;
  String? sys;
  String? ip;
  String? loadavg1m;
  String? loadavg5m;
  String? loadavg12m;

  Sys(
      {this.date,
      this.sys,
      this.ip,
      this.loadavg1m,
      this.loadavg5m,
      this.loadavg12m});

  Sys.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    sys = json['sys'];
    ip = json['ip'];
    loadavg1m = json['loadavg1m'];
    loadavg5m = json['loadavg5m'];
    loadavg12m = json['loadavg12m'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['sys'] = this.sys;
    data['ip'] = this.ip;
    data['loadavg1m'] = this.loadavg1m;
    data['loadavg5m'] = this.loadavg5m;
    data['loadavg12m'] = this.loadavg12m;
    return data;
  }
}

class Disk {
  String? total;
  String? available;
  double? used;
  double? usageRate;

  Disk({this.total, this.available, this.used, this.usageRate});

  Disk.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    available = json['available'];
    used = double.parse(json['used'].toString());
    usageRate = double.parse(json['usageRate'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['available'] = this.available;
    data['used'] = this.used;
    data['usageRate'] = this.usageRate;
    return data;
  }
}
