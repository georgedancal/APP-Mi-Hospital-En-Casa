<template>
  <div id="app" class="app">
    <body>
      <div class="header">
        <img src="../Imagenes/logo.jpg" height="70" width="70" class="Logo" >
        <h1>MI HOSPITAL EN CASA</h1>
        <nav>
          <button v-if="is_auth" v-on:click="loadHome"> Inicio </button>
          <button v-if="is_auth" v-on:click="loadAccount"> Cuenta </button>
          <button v-if="is_auth" v-on:click="logOut"> Cerrar Sesión </button>
          <button v-if="!is_auth" v-on:click="loadLogIn"> Iniciar Sesión </button>
          <button v-if="!is_auth" v-on:click="loadSignUp"> Registrarse </button>
        </nav>
      </div>
      <img class="Medico" src="../Imagenes/LogoAfiliado.png">
      <div class="main-component">
        <router-view v-on:completedLogIn="completedLogIn" v-on:completedSignUp="completedSignUp" v-on:logOut="logOut">
        </router-view>
      </div>
      <div class="footer">
        <h2>Misión TIC 2022</h2>
      </div>
    </body>


  </div>
</template>

<script>
export default {
  name: 'App',
  data: function () {
    return {
      is_auth: false
    }
  },
  components: {
  },

  methods: {
    verifyAuth: function () {
      this.is_auth = localStorage.getItem("isAuth") || false;
      if (this.is_auth == false)
        this.$router.push({ name: "logIn" })
      else
        this.$router.push({ name: "home" });
    },
    loadLogIn: function () {
      this.$router.push({ name: "logIn" })
    },
    loadSignUp: function () {
      this.$router.push({ name: "signUp" })
    },
    loadHome: function () {
      this.$router.push({ name: "home" });
    },
    loadAccount: function () {
      this.$router.push({ name: "account" });
    },
    logOut: function () {
      localStorage.clear();
      alert("Sesión Cerrada");
      this.verifyAuth();
    },
    completedLogIn: function (data) {
      localStorage.setItem("isAuth", true);
      localStorage.setItem("username", data.username);
      localStorage.setItem("token_access", data.token_access);
      localStorage.setItem("token_refresh", data.token_refresh);
      alert("Autenticación Exitosa");
      this.verifyAuth();
    },
    completedSignUp: function (data) {
      alert("Registro Exitoso");
      this.completedLogIn(data);
    },
  },
  created: function () {
    this.verifyAuth()
  }
}
</script>
  

<style>
html{
    height: 100%;
}
body::-webkit-scrollbar{
    width: 5px;
}
body::-webkit-scrollbar-thumb{
    background: rgb(3, 59, 133);
    border-radius: 5px;
}
body{
    margin:0;
    padding:0;
    background-color: aliceblue;
    position: relative;
    min-height: 100vh;
}
.header {
  margin: 0%;
  padding: 0;
  width: 100%;
  min-height: 100px;
  background-color: rgb(53, 225, 255);;
  color: #082b4d;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.header h1 {
  width: 100%;
  text-align: center;
}
.header nav {
  height: 100%;
  width: 20%;
  display: flex;
  font-size: 20px;
}

.header nav button {
  color: #102a44;
  border: 1px solid #1a2631;
  border-radius: 5px;
  padding: 5%;
  margin: 2%;
  background: linear-gradient(to right,rgb(235, 243, 243),rgb(160, 240, 243));
}
.header nav button:hover {
  color: #283747;
  background: linear-gradient(to right,rgb(245, 209, 186),crimson);
  border: 1px solid #E5E7E9;
}
.header .Logo{
    margin-left: 2.5%;
    border: 1px solid rgb(54, 71, 231);
    border-image:10%;
    border-radius: 10%;
}
.Medico{
  border-radius: 10%;
  max-width: 10%;
  display: block;
  margin: auto;
  padding-top: 3%;
  padding-bottom: 3%;
}
.main-component {
  height: 75vh;
  margin: 0%;
  padding: 0%;
  background-color: aliceblue;
}
/*form{
  background: linear-gradient(to right,rgb(235, 243, 243),rgb(160, 240, 243));
}*/
.footer {
  margin: 0;
  padding: 0;
  width: 100%;
  height: 10vh;
  min-height: 100px;
  background-color: rgb(53, 225, 255);
  color: #082b4d;
}

.footer h2 {
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
}
@media screen and (max-width: 400px){
  .header{
    margin: 0%;
    padding: 0;
    width: 100%;
    min-height: 100px;
    background-color: rgb(53, 225, 255);;
    color: #082b4d;
    display: block;
    justify-content: space-between;
    align-items: center;
  }
  .header .nav{
    margin: 0%;
  }
  .header h1{
    font-size:20px;
  }
  .header .Logo{
    height: 50px;
    width: 20 px;
    margin-left: 2.5%;
    border: 1px solid rgb(54, 71, 231);
    border-image:10%;
    border-radius: 10%;
  }
  .app{
    width: 100%;
    display: flex;
    flex-direction: column;
    min-height: 100%;
    margin:0;
    padding:0;
    background-color: aliceblue;
    position: relative;
    min-height: 100vh;
  }
  .Medico{
    border-radius: 10%;
    max-width: 30%;
    display: block;
    margin: auto;
    padding-top: 10%;
  }
  .footer{
    width: 100%;
  }
}
</style>
