<template>
    <div class="signUp_user">
        <div class="container_signUp_user">
            <h2>Registrarse</h2>
            <form v-on:submit.prevent="processSignUp" >
            <input type="text" v-model="user.username" placeholder="Username">
                <br>
                <input type="password" v-model="user.password" placeholder="Password">
                <br>
                <input type="text" v-model="user.name" placeholder="Name">
                <br>
                <input type="email" v-model="user.email" placeholder="Email">
                <br>
                <input type="number" v-model="user.account.balance" placeholder="Initial Balance">
                <br>
                <button type="submit">Registrarse</button>
            </form>
        </div>
    </div>
</template>

<script>
import axios from 'axios';
export default {
    name: "SignUp",
    data: function(){
        return {
            user: {
                username: "",
                password: "",
                name: "",
                email: "",
                account: {
                    lastChangeDate: (new Date()).toJSON().toString(),
                    balance: 0,
                    isActive: true
                }
            }
        }
    },
    methods: {
        processSignUp: function(){
            axios.post(
                "https://mision-tic-bank-be.herokuapp.com/user/",
                this.user,
                {headers: {}}
             )
                .then((result) => {
                    let dataSignUp = {
                        username: this.user.username,
                        token_access: result.data.access,
                        token_refresh: result.data.refresh,
                    }
                        this.$emit('completedSignUp', dataSignUp)
                })
                .catch((error) => {
                    console.log(error)
                    alert("ERROR: Fallo en el registro.");
                });
        }
    }
}
</script>
<style>
    .signUp_user{
        margin: 0;
        padding: 0%;
        height: 100%;
        width: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .container_signUp_user {
        padding: 1%;
        border: 3px solid #283747; 
        border-radius: 10px; 
        width: 25%; 
        height: 60%; 
        display: flex; 
        flex-direction: column; 
        justify-content: center; 
        align-items: center; 
        background: linear-gradient(to right,rgb(235, 243, 243),rgb(160, 240, 243));
    } 
    .signUp_user h2{ 
        color: #283747; 
    } 
    .signUp_user form{ 
        width: 70%; 
    
    } 
    .signUp_user input{ 
        height: 40px; 
        width: 100%; 
        box-sizing: border-box; 
        padding: 10px 20px; 
        margin: 5px0; 
        border: 1px solid #283747; 
    } 
    .signUp_user button{ 
        width: 100%; 
        height: 40px; 
        color: #092746;
        background: linear-gradient(to right,rgb(211, 219, 219),rgb(240, 243, 243));
        border: 1px solid #11406e;
        border-radius: 5px;
        border-radius: 5px; 
        padding: 10px 25px; 
        margin: 5px0 25px0; 
    } 
    .signUp_user button:hover{ 
        color: #E5E7E9; 
        background: linear-gradient(to right,rgb(245, 209, 186),crimson);
        border: 1px solid #283747; 
    } 
@media screen and (max-width: 400px){
    .container_signUp_user{
        padding: 10%;
        width: 70%;
        margin: 10%;
    }
}
</style> 

