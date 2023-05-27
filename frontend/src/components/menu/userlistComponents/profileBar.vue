<template>
	<div class="row h-100 p-0 m-0">
		<div class="col-1 p-0 m-0 h-100 d-flex align-items-center justify-content-center" @click="shouldExpand">
			<i class="fa-solid fa-chevron-up fa-rotate-270 fa-xl"></i>
		</div>
		<div class="col-11 m-0 p-0">
			<div v-if="store.getters.getUser.isLogin" class="h-100 w-100 container">
				<div class="row p-0 m-0 h-50 input-group">
					<div class="col-8 p-0 d-flex align-items-center justify-content-center">
						<input type="text" class="form-control" placeholder="Nickname Giriniz" v-model="addFriendValue">
					</div>
					<div class="col-4 p-0 d-flex align-items-center justify-content-center">
						<button class="btn btn-success w-75" type="button" @click="deneme" >Ekle</button>
					</div>
				</div>
				<div class="row h-50">
					<div class="col-12 d-flex align-items-center justify-content-center">
						<button class="btn btn-secondary w-100" @click="$emit('requestlist')"> Istek Listesi </button>
					</div>
				</div>
			</div>
			<div v-else class="d-flex align-items-center justify-content-center h-100" @click="$emit('loginMenu')">
				<!-- LOGIN OLUN EKRANI -->
				<h2>Lutfen Giris Yapiniz!</h2>
			</div>
		</div>
	</div>
</template>

<style>
.profileimage{
}
.profilecard{
	border: 1px solid white;
	border-radius: 5px;
	width: 90%;
	height: 80%;
}
</style>

<script setup lang="ts">
// @ts-ignore
import { useStore } from 'vuex'
import { ref } from 'vue'
const store = useStore()
const props = defineProps(['shouldExpand'])
const addFriendValue = ref('')
const deneme = () => { 
	console.log(addFriendValue.value)
}
</script>