CREATE TABLE [CMS_OpenIDUser] (
		[OpenIDUserID]          [int] IDENTITY(1, 1) NOT NULL,
		[OpenID]                [nvarchar](450) NOT NULL,
		[OpenIDProviderURL]     [nvarchar](450) NULL,
		[UserID]                [int] NOT NULL
) ON [PRIMARY]
ALTER TABLE [CMS_OpenIDUser]
	ADD
	CONSTRAINT [PK_CMS_OpenIDUser]
	PRIMARY KEY
	CLUSTERED
	([OpenIDUserID])
	WITH FILLFACTOR=80
	ON [PRIMARY]
ALTER TABLE [CMS_OpenIDUser]
	ADD
	CONSTRAINT [DEFAULT_cms_OpenIDUser_OpenID]
	DEFAULT ('') FOR [OpenID]
ALTER TABLE [CMS_OpenIDUser]
	ADD
	CONSTRAINT [DEFAULT_cms_OpenIDUser_UserID]
	DEFAULT ((0)) FOR [UserID]
CREATE NONCLUSTERED INDEX [IX_CMS_OpenIDUser_OpenID]
	ON [CMS_OpenIDUser] ([OpenID])
	WITH ( FILLFACTOR = 80)
	ON [PRIMARY]
CREATE NONCLUSTERED INDEX [IX_CMS_OpenIDUser_UserID]
	ON [CMS_OpenIDUser] ([UserID])
	ON [PRIMARY]
ALTER TABLE [CMS_OpenIDUser]
	WITH CHECK
	ADD CONSTRAINT [FK_CMS_OpenIDUser_UserID_CMS_User]
	FOREIGN KEY ([UserID]) REFERENCES [CMS_User] ([UserID])
ALTER TABLE [CMS_OpenIDUser]
	CHECK CONSTRAINT [FK_CMS_OpenIDUser_UserID_CMS_User]
