
<template>
	<div class="w-100 overflow-y-auto">
		<div class="list-group w-100 mh-0">
			<div class="list-group-item list-group-item-action d-flex" v-for="i in 5" :key="i">
				<div class="container d-flex">
					<div class="col-10 d-flex p-0 m-0">
						<h4> {{'<Request from>'}} {{ i }} </h4>
						<p> {{ '<Rank : 500>' }}</p>
					</div>
					<div class="col-2 d-flex justify-content-around align-items-center p-0 m-0 border-start">
						<a class="icon-link" style="text-decoration: none;" @click="" href="#">
							<i class="fa-solid fa-check fa-2xl" style="color: #2fbc31;"></i>
						</a>
						<a class="icon-link" style="text-decoration: none;" @click="" href="#">
							<i class="fa-solid fa-xmark fa-2xl" style="color: #ca2f2f;"></i>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>

<style>
.mh-0{
	max-height: 0;
}
</style>

<script setup lang="ts">
// @ts-ignore
import {useStore} from 'vuex'
const store = useStore()
</script>