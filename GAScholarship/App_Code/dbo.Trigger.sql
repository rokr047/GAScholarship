CREATE TRIGGER tgr_updateApplicationStatus
	ON [dbo].[t_Recommendation]
	FOR UPDATE
	AS	
	DECLARE
	@application_Number int,
	@reco_Number1 int,
	@reco_Number2 int,
	@reco2Status text,
	@reco1Status text
	BEGIN
		SET NOCOUNT ON
		
		UPDATE t_Application SET status='Recommendation 1 Received' WHERE applicationNumber=@application_Number;
	END
