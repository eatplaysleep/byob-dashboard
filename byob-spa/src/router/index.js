import Vue from 'vue';
import Router from 'vue-router';
import OktaVue, { LoginCallback } from '@okta/okta-vue';
import { OktaAuth } from '@okta/okta-auth-js';
import Home from '@/views/Home.vue';
import Settings from '@/views/Settings.vue';
import Activate from '@/components/Activate';
import config from '@/.config';

Vue.use(Router);
console.log(process.env.BASE_URL);

const router = new Router({
	mode: 'history',
	base: process.env.BASE_URL,
	routes: [
		{
			path: '/',
			name: 'home',
			component: Home,
			meta: {
				title: 'Home',
				requiresAuth: true,
			},
		},
		{
			path: '/oauth/callback',
			component: LoginCallback,
		},
		{
			path: '/settings',
			name: 'settings',
			component: Settings,
			props: true,
			meta: {
				title: 'Settings',
				requiresAuth: true,
			},
		},
		{
			path: '/activate/:token',
			name: 'activate',
			component: Activate,
			meta: {
				title: 'Activate',
			},
		},
	],
});

config.oidc.redirect_uri = window.location.protocol + '//' + window.location.host + config.oidc.redirect_uri;

const { client_id: clientId, redirect_uri: redirectUri, ...oidcConfig } = config.oidc;
console.log(config.oidc);
const oktaAuth = new OktaAuth({
	clientId,
	redirectUri,
	...oidcConfig,
	scopes: typeof config.oidc.scope === 'string' ? config.oidc.scope.split(' ') : config.oidc.scope,
	pkce: true,
});

Vue.use(OktaVue, { oktaAuth });

export default router;
