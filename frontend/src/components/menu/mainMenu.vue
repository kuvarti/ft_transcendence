<template>
	<div class="d-flex justify-content-end">
		<div class="main-menu menus">
			<button @click="swtch()" class="btn btn-sm btn-primary deneme"></button>
			<div>
				<!-- There is filled something -->
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
}
.main-menu{
	margin-top: 10%;
	width: 100%;
	height: 80%;
	border: 1px solid #fff;
}
</style>

<script setup lang="ts">
import { computed } from "vue";
// @ts-ignore
import { useStore } from "vuex";
const store = useStore();

const playstat = computed(store.getters.getPlaystat)
//store.getters.getPlaystat;

const swtch = () => {
	if (playstat)
		store.dispatch('gameOn')
	setTimeout(() => {
		store.dispatch('gameoff')
	}, 1000);
}
</script>