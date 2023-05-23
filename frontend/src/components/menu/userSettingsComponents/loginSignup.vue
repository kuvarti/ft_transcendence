<template>
	<div class="d-flex w-100 h-100 p-0 m-0 align-items-center flex-column">
		<div class="btn-group w-75">
			<button class="btn btn-lg btn-success">Log In</button>
			<button class="btn btn-lg btn-primary">Sign In</button>
		</div>
		<div class="myform w-75 d-flex align-items-center justify-content-evenly flex-column">
			<div class="input-group mb-3 w-90">
				<span class="input-group-text" id="basic-addon1">@</span>
				<input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
			</div>
			<div class="input-group mb-3 w-90">
				<span class="input-group-text" id="basic-addon1">@</span>
				<input type="Password" class="form-control" placeholder="Password" aria-label="Password" aria-describedby="basic-addon1">
			</div>
			<div class="input-group mb-3 w-90">
				<span class="input-group-text" id="basic-addon1">@</span>
				<input type="Password" class="form-control" placeholder="Re-password" aria-label="Re-password" aria-describedby="basic-addon1">
			</div>
		</div>
	</div>
</template>

<style>
.w-90{
	width: 90% !important;
}
.myform{
	margin-top: 5px;
	padding-top: 10px;
	border-radius: 20px;
	border: 1px solid white;
}
</style>

<script setup lang="ts">

</script>