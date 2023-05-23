<template>
	<div class="d-flex justify-content-end">
		<div class="main-menu menus">
			<button @click="swtch()" class="btn btn-lg btn-primary deneme">{{btntext}}</button>
			<div class="d-flex align-items-center flex-column">
				<h1>Match Histories</h1>
				<h1 v-for="i in 4" :key="i">.</h1>
			</div>
		</div>
	</div>
</template>

<style>
.deneme{
	width: 80%;
	height: 10%;
	border-radius: 100%;
	margin: 5% 10% 5% 10%;
	border: 0px 0px 1px 0px solid red;
}
.main-menu{
	margin-top: 10%;
	width: 100%;
	height: 80%;
	border: 1px solid #fff;
}
</style>

<script setup lang="ts">
import { computed, ref } from "vue";
// @ts-ignore
import { useStore } from "vuex";
const store = useStore();
const btntext = ref('Play Game!')
const playstat = computed(store.getters.getPlaystat)
//store.getters.getPlaystat;

const swtch = () => {
	if (playstat)
	{
		btntext.value = 'Matchmaking...'
		setTimeout(() => {
			store.dispatch('gameOn')
		}, 1000);
	}
	setTimeout(() => {
		store.dispatch('gameoff')
	}, 2000);
}
</script>