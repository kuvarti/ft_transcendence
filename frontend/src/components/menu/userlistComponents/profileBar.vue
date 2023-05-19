<template>
	<div class="row h-100 p-0 m-0">
		<div class="col-1 p-0 m-0 h-100 d-flex align-items-center justify-content-center" @click="shouldExpand">
			<i class="fa-solid fa-chevron-up fa-rotate-270 fa-xl"></i>
		</div>
		<div class="col-11 m-0 p-0">
			<div v-if="store.getters.getUser.isLogin" class="h-100 w-100 d-flex align-items-center justify-content-center">
				<div class="profilecard d-flex">
					<div class="row m-0 p-0 h-100">
						<div class="col-8 m-0 p-0 h-100">
							<div class="">
								<h3 class="p-0 m-0">{{ store.getters.getUser.username || " Login olunuz" }}</h3>
								<small style="color:green">Online</small>
							</div>
							<div class="float-bottom">
								<h4> Rank : {{ store.getters.getUser.rank || 501 }} </h4>
							</div>
						</div>
						<div class="col-4 m-0 p-0 h-100 d-flex align-items-center justify-content-center">
							<img src="https://html.com/wp-content/uploads/flamingo.jpg" alt="example" class="img-thumbnail p-0 profileimage">
						</div>
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
import { useStore } from 'vuex'
const store = useStore()
const props = defineProps(['shouldExpand'])
const deneme = () => { 
	alert('asdasdasd')
}
</script>