class EndPoints {

  ///---------------------------------------------- Base url ----------------------------------------------
  static const baseUrl = 'https://routerunnerserver.onrender.com/api';


  ///---------------------------------------------- Keys ----------------------------------------------
  static const login = "$baseUrl/employee/login";
  static const editProfile = "$baseUrl/employee/edit-employee/";
  static const employeeStatus = "$baseUrl/employee/employee/employeestatus/";
  static const addNewRepair = "$baseUrl/employee/repair/";
  static const addNewCollection = "$baseUrl/employee/collection/";
  static const addNewServiceReport = "$baseUrl/employee/servicereport/";
  static const getLocation = "$baseUrl/employee/location/";
  static const getMachine = "$baseUrl/employee/machine/";
  static const getCollection = "$baseUrl/employee/collection/";
  static const getRepair = "$baseUrl/employee/employees/";
  static const getRecentCollection = "$baseUrl/employee/recent-collection/";
  static const getServiceReport = "$baseUrl/employee/service/";
  static const lastCollection = "$baseUrl/employee/last-collection/";
  static const locationApi = "$baseUrl/location";
  static const allCollection = "$baseUrl/employee/collection/";
  static const pendingRepairs = "$baseUrl/employee/pending/";
  static const forgotPassword = "$baseUrl/employee/forgot-password";
  static const otp = "$baseUrl/employee/verify-otp/";

}
